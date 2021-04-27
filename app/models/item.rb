class Item < ApplicationRecord


<<<<<<< HEAD
  attachment :image

  belongs_to :genre
  has_many :cart_items

  has_many :customers, through: :cart_items
  has_many :order_details
  has_many :items, through: :order_details

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  # validates :image_id, presence: true


=======
>>>>>>> origin/develop
  attachment :image


  belongs_to :genre
  has_many :cart_items

  has_many :customers, through: :cart_items
  has_many :order_details
  has_many :items, through: :order_details

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true

  def status
    if self.is_saled
     "販売中"
    else
      "販売停止中"
    end
  end

<<<<<<< HEAD
  scope :is_active, -> { where(is_saled: true) }

=======
  # scope :is_active, -> { where(is_saled: true) }
>>>>>>> origin/develop

  # 税込み価格をただ出したいとき用
  def add_tax_price
      (self.price * 1.08).round
  end

  # 税込み価格をpriceに入れたいとき用
  def tax_price
      self.price = (self.price * 1.08).round
  end


end