require 'rails_helper'

RSpec.describe PayUserAddress, type: :model do
  before do
    @pay_user_address = FactoryBot.build(:pay_user_address)
  end

  describe '商品の購入' do
    it "全ての項目が記入されていれば購入できる" do
    expect(@pay_user_address).to be_valid
   end

   it "郵便番号が記入されていないと購入できない" do
    @pay_user_address.postal_code = nil
    @pay_user_address.valid?
    expect(@pay_user_address.errors.full_messages).to include("Postal code can't be blank")
   end

   it "郵便番号はハイフンがないと購入できない" do
    @pay_user_address.postal_code = "1234567"
    @pay_user_address.valid?
    expect(@pay_user_address.errors.full_messages).to include("Postal code is invalid")
   end

   it "都道府県が選択されていないと購入できない" do
    @pay_user_address.area_id = nil
    @pay_user_address.valid?
    expect(@pay_user_address.errors.full_messages).to include("Area can't be blank")
   end
   it "市区町村が記入されていないと購入できない" do
    @pay_user_address.city = nil
    @pay_user_address.valid?
    expect(@pay_user_address.errors.full_messages).to include("City can't be blank")
   end
   it "番地が記入されていないと購入できない" do
    @pay_user_address.house_number = nil
    @pay_user_address.valid?
    expect(@pay_user_address.errors.full_messages).to include("House number can't be blank")
   end

   it "電話番号が記入されていないと購入できない" do
    @pay_user_address.telephone_number = nil
    @pay_user_address.valid?
    expect(@pay_user_address.errors.full_messages).to include("Telephone number is too short (minimum is 11 characters)")
   end

   it "カード情報がないと購入できない" do
    @pay_user_address.token = nil
    @pay_user_address.valid?
    expect(@pay_user_address.errors.full_messages).to include("Token can't be blank")
   end
  end
end
