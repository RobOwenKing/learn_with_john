class Category < ApplicationRecord
  has_many :topics

  validates :name
  validates :current
end
