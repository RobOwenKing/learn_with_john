class AddTimezoneToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :timezone, :string
  end
end
