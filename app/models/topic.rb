class Topic < ApplicationRecord
  belongs_to :category
  has_many :practiseds, dependent: :destroy

  validates :name, presence: true
  validates :category_id, presence: true
end
