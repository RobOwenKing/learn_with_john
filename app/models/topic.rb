class Topic < ApplicationRecord
  has_many :practiseds, dependent: :destroy

  validates :name, presence: true
end
