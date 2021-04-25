class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  validates :customer_id, presence: true
  validates :items_id, presence: true
  
end
