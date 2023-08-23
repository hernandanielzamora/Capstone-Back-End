class CreateReservationRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :reservation_rooms do |t|
      t.references :reservation, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
    end
  end
end
