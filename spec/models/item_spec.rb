require 'rails_helper'

RSpec.describe 'アイテム商品出品', type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品情報を入力する' do
    it "全て入力すれば出品できる" do
      expect(@item).to be_valid

    end
  end
  
  context '情報がないと出品できない' do
    it "画像1枚必須" do
      @item.image= nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名を入力されている" do
      @item.product = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product can't be blank")
    end
    it "商品説明を入力されているか" do
      @item.product_copy = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Product copy can't be blank")
    end
    it "カテゴリが空（選択できていない）ではないか" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "カテゴリを正く選択されているか" do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it "商品の状態が空（選択できていない）ではない" do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "商品の状態を正く選択されているか" do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
    end
    it "発送元の地域が空（選択できていない）ではない" do
      @item.area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it "発送元の地域を正く選択されているか" do
      @item.area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 0")
    end
    it "発送までの日数が空（選択できていない）ではない" do
      @item.area_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Area day can't be blank")
    end
    it "発送までの日数を正く選択されているか" do
      @item.area_day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Area day must be other than 0")
    end
    it "値段の確認" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格が全角数字登録できない" do
      @item.price = "２２２２２２"
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is not included in the list")
    end
    it "販売価格が半角英数字混合だと登録できない" do
      @item.price = "abc123"
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is not included in the list")
    end
    it "販売価格が￥300~￥9,999,999の間であること" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it "販売価格が￥300~￥9,999,999の間であること" do
      @item.price = 10000000 
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it "ユーザー情報が取得できていること" do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")  
    end
  end
end
