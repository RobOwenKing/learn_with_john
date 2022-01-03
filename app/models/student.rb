class Student < ApplicationRecord
  has_many :practiseds, dependent: :destroy

  validates :name_en, presence: true
  validates :onboarding, presence: true
end
