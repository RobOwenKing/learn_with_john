class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name_zh
      t.string :name_en
      t.text :onboarding
      t.text :notes

      t.timestamps
    end
  end
end
