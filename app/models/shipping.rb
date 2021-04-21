class Shipping < ApplicationRecord

  validates :postal_code,length:{ minimum: 7, maximum: 7}
  validates :address, presence: true
  validates :name,length:{ minimum: 2, maximum: 20 }  
    
end
