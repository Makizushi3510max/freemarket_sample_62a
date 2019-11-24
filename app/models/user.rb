class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  has_many :addresses
  has_one :card
  has_one_attached :avatar

  # devise コールバック時にこいつが呼び出される
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize do |user|
      user.nickname = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i          # emailの正規表現
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}\z/i   # passwordの正規表現
  VALID_NAME_REGEX = /\A[一-龥ぁ-ん]/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/


  # nicknameのバリデーション
  validates :nickname,
    presence: true,                             # 存在していることを検証
    length: { minimum: 1, maximum: 20 }         # 最小1文字,最大20文字の間に納まっているかを検証

  # emailのバリデーション
  validates :email,
    presence: true,                             # 存在していることを検証
    uniqueness: { case_sensitive: false },      # 他のユーザとメールアドレスが被っていないかを検証(大文字と小文字を区別しない)
    format: { with: VALID_EMAIL_REGEX }         # 定数VALID_EMAIL_REGEXに合致しているかを検証

  # passwordのバリデーション
  validates :password,
    presence: true,                             # 存在していることを検証
    length: { minimum: 7, maximum: 128},        # 最小7文字,最大128文字の間に納まっているかを検証
    format: { with: VALID_PASSWORD_REGEX }      # 定数VALID_PASSWORD_REGEXに合致しているかを検証

  # last_nameのバリデーション
  validates :last_name,
    presence: true,
    length: { maximum: 20 },
    format: { with: VALID_NAME_REGEX }

  # first_nameのバリデーション
  validates :first_name,
    presence: true,
    length: { maximum: 20 },
    format: { with: VALID_NAME_REGEX }

  # last_name_kanaのバリデーション
  validates :last_name_kana,
  presence: true,
  length: { maximum: 20 },
  format: { with: VALID_NAME_KANA_REGEX }

  # first_name_kanaのバリデーション
  validates :first_name_kana,
    presence: true,
    length: { maximum: 20 },
    format: { with: VALID_NAME_KANA_REGEX }

  # date_of_birthのバリデーション
  validates :date_of_birth,
    presence: true

  # phone_numberのバリデーション
  validates :phone_number,
    presence: true,
    format: { with: VALID_PHONE_NUMBER_REGEX }

  # バリデーションの条件分岐を後々実装したい
  # with_options on: :registration do |registration|
  # end

  # with_options on: :sms do |sms|
  # end
end
