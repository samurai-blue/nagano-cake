class Item < ApplicationRecord
  attachment :image
  belongs_to  :genre
  has_many :cart_items

  def status
    if self.is_saled
     "販売中"
    else
      "販売停止中"
    end
  end

  # 税込み価格をただ出したいとき用
  def add_tax_price
      (self.price * 1.08).round
  end

  # 税込み価格をpriceに入れたいとき用
  def tax_price
      self.price = (self.price * 1.08).round
  end

end