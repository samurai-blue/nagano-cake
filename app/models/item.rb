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
end
