class Student < ApplicationRecord
  has_many :practiseds

  validates :name_en, presence: true
  validates :onboarding, presence: true
end
