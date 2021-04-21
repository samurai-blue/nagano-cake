class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :email,
              :postal_code, :address, :telephone_number,
              presence: true

    # 会員フルネーム
  def full_name
    self.last_name + " " + self.first_name
  end
  def kana_full_name
    self.last_name_kana + " " + self.first_name_kana
  end  
  
end
