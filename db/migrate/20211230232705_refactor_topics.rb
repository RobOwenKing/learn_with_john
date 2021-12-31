class RefactorTopics < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :is_part_1, :boolean
    rename_column :topics, :questions, :part_1
    rename_column :topics, :follow_ups, :part_2
    add_column :topics, :part_3, :text
  end
end
