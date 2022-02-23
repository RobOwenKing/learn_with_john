class AddColourToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :colour, :string
  end
end
