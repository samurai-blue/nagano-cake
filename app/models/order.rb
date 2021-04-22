class Order < ApplicationRecord

  belongs_to :customer

  def full_name
    self.last_name + " " + self.first_name
  end

end
