class Topic < ApplicationRecord
  belongs_to :category
  has_many :practiseds, dependent: :destroy

  validates :name, presence: true
  validates :category_id, presence: true
  validate :part_1_or_2_present?

  def part_1_or_2_present?
    return unless %w[part_1 part_2].all? { |attr| self[attr].blank? }

    errors.add :part_1, "cannot be blank if part 2 is blank"
    errors.add :part_2, "cannot be blank if part 1 is blank"
  end
end
