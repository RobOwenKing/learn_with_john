class Category < ApplicationRecord
  has_many :topics

  validates :name, presence: true
  validates :current, inclusion: [true, false]
end
