class Practised < ApplicationRecord
  belongs_to :student
  belongs_to :topic
  belongs_to :user

  validates :student, presence: true
  validates :topic, presence: true
  validates :user, presence: true
end
