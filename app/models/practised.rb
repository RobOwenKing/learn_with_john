class Practised < ApplicationRecord
  belongs_to :user
  belongs_to :student
  belongs_to :topic
end
