class RenameNameZhToNameWechat < ActiveRecord::Migration[5.2]
  def change
    rename_column :students, :name_zh, :name_wechat
  end
end
