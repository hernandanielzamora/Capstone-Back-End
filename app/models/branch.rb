class Branch < ApplicationRecord
  has_many :rooms, dependent: :destroy

  validates :city, presence: true
end
