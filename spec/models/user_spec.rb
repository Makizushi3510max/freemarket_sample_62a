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

  end
end