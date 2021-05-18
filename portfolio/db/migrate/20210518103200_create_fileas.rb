class CreateFileas < ActiveRecord::Migration[6.1]
  def change
    create_table :fileas do |t|
      t.string :title
      t.text :content
      t.string :file
      t.integer :user_id

      t.timestamps
    end
  end
end
