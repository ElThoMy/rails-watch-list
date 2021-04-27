class ChangeTitleToNameForLists < ActiveRecord::Migration[6.1]
  def change
    rename_column :lists, :title, :name
  end
end
