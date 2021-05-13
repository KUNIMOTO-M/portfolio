class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :area, :integer, default: 0
    add_column :users, :introduction, :text
  end
end
