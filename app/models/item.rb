class Item < ApplicationRecord
  
 
  attachment :image
<<<<<<< HEAD
  belongs_to  :genre

=======
 
  belongs_to :genre
  has_many :cart_items
  
  has_many :customers, through: :cart_items
  has_many :order_details
  has_many :items, through: :order_details
  
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image_id, presence: true
  
  
>>>>>>> 8ef09187159921443fe1adb4ba4e7dc00e126103
  def status
    if self.is_saled
     "販売中"
    else
      "販売停止中"
    end
  end
<<<<<<< HEAD

  # 税込み価格をただ出したいとき用
  def add_tax_price
      (self.price * 1.08).round
  end

  # 税込み価格をpriceに入れたいとき用
  def tax_price
      self.price = (self.price * 1.08).round
  end
=======
  
  scope :is_active, -> { where(is_saled: true) }
>>>>>>> 8ef09187159921443fe1adb4ba4e7dc00e126103

end
