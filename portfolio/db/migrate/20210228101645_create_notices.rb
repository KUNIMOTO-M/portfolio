class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.string :notice_title
      t.text :notice_body
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :notices, [:user_id, :created_at]
  end
end
