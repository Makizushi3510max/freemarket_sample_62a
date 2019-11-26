class Address < ApplicationRecord
  belongs_to :user

  VALID_NAME_REGEX = /\A[一-龥ぁ-ん]/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  VALID_PHONE_NUMBER_REGEX = /\A\d{10,11}\z/

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

  # postal_codeのバリデーション
  validates :postal_code,
    presence: true

  # prefectureのバリデーション
  validates :prefecture,
    presence: true

  # city_nameのバリデーション
  validates :city_name,
    presence: true

  # block_numberのバリデーション
  validates :block_number,
    presence: true

  # building_nameのバリデーション
  # validates :building_name,
  #   presence: true

  # phone_numberのバリデーション
  # validates :phone_number,
  #   presence: true,
  #   format: { with: VALID_PHONE_NUMBER_REGEX }
end
