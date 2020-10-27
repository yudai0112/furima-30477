class Buy < ApplicationRecord
  belongs_to_active_hash :area
  belongs_to :order

  with_options presence: true do
  validates :area_id,numericality: { other_than: 0 }
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
  validates :city
  validates :address
  validates :tel, format: { with: /\A\d{11}\z/}
  end

end
