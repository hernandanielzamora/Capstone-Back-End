class Reservation < ApplicationRecord
  belongs_to :user
  has_many :reservation_rooms, dependent: :destroy
  has_many :rooms, through: :reservation_rooms

  validates :reservation_date, presence: true
  validates :city, presence: true
  validates :total_cost, presence: true, numericality: { greater_than: 0 }
end
