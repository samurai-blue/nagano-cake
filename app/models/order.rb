class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  #中間テーブルを介して複数のプロダクトを持つ
  has_many :items, :through => :order_items

  belongs_to :customer
  
  validates :name, presence: true 
  validates :postal_code, presence: true
  validates :shipping, presence: true

  def full_name
    self.last_name + " " + self.first_name
  end

end
