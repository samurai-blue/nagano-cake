class Item < ApplicationRecord
  
 
  attachment :image
 
  belongs_to :genre
  has_many :cart_items
  
  has_many :customers, through: :cart_items
  has_many :order_details
  has_many :items, through: :order_details
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_id, presence: true
  
  
  def status
    if self.is_saled
     "販売中"
    else
      "販売停止中"
    end
  end
end
