class CreateTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :topics do |t|
      t.string :name
      t.boolean :is_part_1
      t.text :questions
      t.text :follow_ups

      t.timestamps
    end
  end
end
