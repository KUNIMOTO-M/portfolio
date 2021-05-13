class AddAreaToNotices < ActiveRecord::Migration[6.1]
  def change
    add_column :notices, :area, :integer, default: 0
  end
end
