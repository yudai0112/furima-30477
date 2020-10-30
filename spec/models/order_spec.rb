
require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#create' do
    before do
      @order = FactoryBot.build(:order)
    end
    it "order_idとuser_idがあれば登録できる" do
      expect(@order).to be_valid
      binding.pry
    end
    it "item_idが空の場合登録できない" do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item must exist", "User must exist")
    end
    it "user_idが空の場合登録できない" do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item must exist", "User must exist")
    end
  end
end
