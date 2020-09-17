require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー情報の保存' do
    before do
    @user = FactoryBot.build(:user)
  end

  it '全ての値が正しく入力されれば保存されること' do
    expect(@user).to be_valid
  end

  it 'パスワードが６字以上でないと保存できない事' do
    @user.password = "abcde"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  it 'nicknameが空だと保存されないこと' do
    @user.nickname = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'first_nameが空だと保存されない事' do 
    @user.first_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it 'first_nameが全角日本語ではいと保存されない事' do
    @user.first_name = "yamada"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
  end

  it 'last_nameが空だと保存されないこと' do
    @user.last_name = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it 'last_nameが全角日本語でないと保存されない事' do
    @user.last_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
  end

  it 'first_furiganaが空だと保存されない事' do
    @user.first_furigana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("First furigana can't be blank")
  end

  it 'first_furiganaが全角カタカナでないと保存されない事' do
    @user.first_furigana = "ﾔﾏﾀﾞ"
    @user.valid?
    expect(@user.errors.full_messages).to include("First furigana is invalid. Input full-width katakana characters.")
  end

  it 'last_furiganaが空だと保存されない事' do
    @user.last_furigana = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Last furigana can't be blank")
  end

  it 'last_furiganaが全角カタカナでないと保存されない事' do
    @user.first_furigana = "ﾀﾛｳ"
    @user.valid?
    expect(@user.errors.full_messages).to include("First furigana is invalid. Input full-width katakana characters.")
  end

  it 'birthdayが空だと保存されないこと' do
    @user.birthday = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end
end
