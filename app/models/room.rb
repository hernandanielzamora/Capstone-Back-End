class Room < ApplicationRecord
  belongs_to :branch
  has_one :reservation_room
  has_one :reservation, through: :reservation_room

  validates :name, presence: true
  validates :guest, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :beds, presence: true, numericality: { only_integer: true }
  validates :description, presence: true
  validates :photo, presence: true
  validates :cost, presence: true, numericality: { greater_than: 0 }
  validates :reserved, inclusion: { in: [true, false] }
end
