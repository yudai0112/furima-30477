require 'rails_helper'
RSpec.describe Buy, type: :model do
  describe '#create' do
    before do
      @buy = FactoryBot.build(:OrderBuy)
    end
    it "全ての値がかいっていれば登録できる" do
      expect(@buy).to be_valid
    end
    it "郵便番号が空だと登録できない" do
      @buy.postal_code = ""
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end
    it "郵便番号は数字半角3桁-4桁でなければ登録できない" do
      @buy.postal_code = "a00-0000"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code is invalid")
    end
    it "郵便番号「-」を含まれていないと登録できない" do
      @buy.postal_code = "0000000"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Postal code is invalid")
    end
    it "都道府県が空では登録できない" do
      @buy.area_id = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Area can't be blank", "Area is not a number")
    end
    it "都道府県が正く選択されているか" do
      @buy.area_id = 0
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Area must be other than 0")
    end
    it "市区町村が空では登録できない" do
      @buy.city = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("City can't be blank")
    end
    it "番地が空では登録できない" do
      @buy.address = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Address can't be blank")
    end
    it "電話番号は10桁以上出ないといけない" do
      @buy.tel = "000054321"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Tel is invalid")
    end
    it "電話番号は11桁までであるか" do
      @buy.tel = "1234567891"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Tel is invalid")
    end
    it "電話番号は半角数字のみ" do
      @buy.tel = "000ab00ab000"
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Tel is invalid")
    end
    it "トークンが空では登録できない" do
      @buy.token = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
    end
  end
end
