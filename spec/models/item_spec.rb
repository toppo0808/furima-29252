require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      # binding.pry
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
      @item.image = fixture_file_upload('app/assets/images/camera.png')
    end
  describe '商品投稿' do
      it "全ての項目を記入、又は選択すると投稿できる。" do
      expect(@item).to be_valid
      end

      it "商品の写真が無いと投稿できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "商品の名前を記入できていないと投稿できない" do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "説明欄が空欄だと投稿できない。" do
      @item.explanation = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "カテゴリーが空欄だと投稿できない" do
      @item.category_id= ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "商品の状態が空欄だと投稿できない" do
      @item.status_id= ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "配送料の負担が空欄だと投稿できない" do
      @item.fee_id= ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it "発送元の地域が空欄だと投稿できない。" do
      @item.area_id= ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
      end

      it "発送までの日数が空欄だと投稿できない。" do
      @item.sending_date_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Sending date can't be blank")
      end

    it "価格が空欄だと投稿できない。" do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price This site is only for under 99999999 and over 300")
    end
    it "価格が300~99999999の中でしか投棄できない" do
    @item.price = "200"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price This site is only for under 99999999 and over 300")
   end
    it "価格は半角英数字のみでしか投稿できない" do
    @item.price= "３００"
    @item.valid?
    expect(@item.errors.full_messages).to include("Price This site is only for under 99999999 and over 300")
    end
  end
end
