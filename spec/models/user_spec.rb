require 'rails_helper'
describe User do
  describe '#create' do
    # nickname, email, password, last_name, first_name, last_name_kana, first_name_kana, date_of_birth, phone_numberが存在すれば登録できる
    it "is valid with a nickname, email, password, last_name, first_name, last_name_kana, first_name_kana, date_of_birth, phone_number" do
      user = build(:user)
      expect(user).to be_valid
    end
    # ニックネームが空では登録できない
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end
    # emailが空では登録できない
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end
    # passwordが空では登録できない
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end
    # last_nameが空では登録できない
    it "is invalid without a last_name" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    # first_nameが空では登録できない
    it "is invalid without a first_name" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    # last_name_kanaが空では登録できない
    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end
    # first_name_kanaが空では登録できない
    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    # date_of_birthが空では登録できない
    it "is invalid without a date_of_birth" do
      user = build(:user, date_of_birth: nil)
      user.valid?
      expect(user.errors[:date_of_birth]).to include("can't be blank")
    end
    # phone_numberが空では登録できない
    it "is invalid without a phone_number" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("can't be blank")
    end
    # nicknameが21文字以上であれば登録できないこと
    it "is invalid with a nickname that has more than 21 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("is too long (maximum is 20 characters)")
    end
    # nicknameが20文字以下では登録できること
    it "is valid with a nickname that has less than 20 characters " do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa")
      expect(user).to be_valid
    end
    # 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
    # passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000aaa")
      user.valid?
      expect(user).to be_valid
    end
    # passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000aaa")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end
  end
end