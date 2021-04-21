class Shipping < ApplicationRecord

  belongs_to :customer

  validates :address, :postal_code, :name, presence: true
  validates :postal_code,length:{ minimum: 7, maximum: 7}, numericality: { only_integer: true }

end
