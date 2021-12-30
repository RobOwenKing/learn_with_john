class Student < ApplicationRecord
  validates :name_en, presence: true
  validates :onboarding, presence: true
end
