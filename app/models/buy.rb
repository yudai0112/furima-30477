class Buy < ApplicationRecord
  belongs_to_active_hash :area
  belongs_to :order


end
