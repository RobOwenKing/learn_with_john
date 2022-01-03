class Practised < ApplicationRecord
  belongs_to :student
  belongs_to :topic

  validates :student, presence: true
  validates :topic, presence: true
end
