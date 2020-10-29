class OrderBuy
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :city, :address, :building,:tel, :user_id, :item_id, :order_id, :token

  with_options presence: true do
    validates :area_id,numericality: { other_than: 0 }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :city
    validates :address
    validates :tel, format: { with: /\A\d{11}\z/}
    validates :token
  end


def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Buy.create( postal_code: postal_code, area_id: area_id, city: city, address: address, building: building,tel: tel, order_id: order.id)
end

end