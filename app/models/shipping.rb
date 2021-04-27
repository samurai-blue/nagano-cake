class Shipping < ApplicationRecord

  belongs_to :customer

  validates :customer_id, :address, :postal_code, :name, presence: true
  validates :postal_code,length:{ minimum: 7, maximum: 7}, numericality: { only_integer: true }
  validates :name, length: {minimum: 2, maximum: 35}
  validates :address, length: {minimum: 2, maximum: 50}
 
  def order_address
    self.postal_code + self.address + self.name
  end

end
