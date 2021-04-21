class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, :first_name, :last_name_kana, :first_name_kana, :email,
              :postal_code, :address, :telephone_number,
              presence: true


  #ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないようにする。
  # true = ログインユーザーが有効な状態（退会していない）
  def active_for_authentication?
    super && (self.is_valid == true)
  end

end
