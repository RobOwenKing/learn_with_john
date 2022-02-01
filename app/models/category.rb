class Category < ApplicationRecord
  has_many :topics

  validates :name, presence: true
  validates :current, presence: true
end
