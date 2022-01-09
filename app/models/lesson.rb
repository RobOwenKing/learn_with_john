class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :student

  validates :user, uniqueness: { scope: :student }
  validates :student, uniqueness: { scope: :user }
end
