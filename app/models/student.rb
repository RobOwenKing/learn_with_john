class Student < ApplicationRecord
  has_many :practiseds, dependent: :destroy
  has_many :lessons
  has_many :students, through: :lessons

  validates :name_en, presence: true
  validates :onboarding, presence: true

  def teachers
    users
  end
end
