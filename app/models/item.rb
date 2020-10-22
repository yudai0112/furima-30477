class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :area_day
  has_one_attached :image
  belongs_to :user

  validates :product, :product_copy, :category_id, :status_id, presence: true
  validates :burden_id, :area_id :area_day_id, :price, :image, presence: true

  validates :category_id, :status_id, :burden_id, :area_id, :area_day_id, numericality: { other_than: 0 } 

end
