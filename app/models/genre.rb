class Genre < ApplicationRecord
  validates :name, presence: true
  has_many :items

  #scope :is_valid, -> { where(validity: true) }

end
