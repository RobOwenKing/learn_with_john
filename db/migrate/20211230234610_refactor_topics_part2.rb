class RefactorTopicsPart2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :topics, :part_2, :part_2_hints
    add_column :topics, :part_2, :string
  end
end
