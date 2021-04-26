class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  #中間テーブルを介して複数のプロダクトを持つ
  has_many :items, :through => :order_details


  validates :name, presence: true
  validates :postal_code, presence: true
  validates :send_to_address, presence: true

  #enum_支払い方法
  #enum payment_method: {"クレジットカード": 0,"銀行振込": 1}
  #注文ステータス
	#enum order_status: {"入金待ち": 0,"入金確認": 1,"製作中": 2,"発送準備中": 3, "発送済み": 4}

  def full_name
    self.last_name + " " + self.first_name
  end

end
