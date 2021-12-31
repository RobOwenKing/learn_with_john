class Practised < ApplicationRecord
  belongs_to :user
  belongs_to :student, dependent: :destroy
  belongs_to :topic, dependent: :destroy

  validates :student, presence: true
  validates :topic, presence: true
end
