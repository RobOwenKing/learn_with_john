class Topic < ApplicationRecord
  has_many :practiseds

  validates :name, presence: true
end
