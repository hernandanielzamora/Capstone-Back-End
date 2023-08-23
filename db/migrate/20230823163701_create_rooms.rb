class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.integer :guest, null: false
      t.integer :beds, null: false
      t.text :description, null: false
      t.string :photo, null: false
      t.decimal :cost, null: false
      t.boolean :reserved, null: false, default: false
      t.references :branch, null: false, foreign_key: true
    end
  end
end
