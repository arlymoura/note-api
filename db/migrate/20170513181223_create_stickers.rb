class CreateStickers < ActiveRecord::Migration[5.0]
  def change
    create_table :stickers do |t|
      t.string :name
      t.text :body
      t.integer :count
      t.datetime :fist_view
      t.integer :type
      t.integer :status

      t.timestamps
    end
  end
end
