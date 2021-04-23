class Item < ApplicationRecord
  
  belongs_to :genre
  attachment :image
  
  
  def status
    if self.is_saled
     "販売中"
    else
      "販売停止中"
    end
  end
end
