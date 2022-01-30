class AddAppToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :app, :string
  end
end
