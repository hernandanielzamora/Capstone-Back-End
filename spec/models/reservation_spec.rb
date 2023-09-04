require_relative '../rails_helper'

RSpec.describe Reservation, type: :model do
  user_one = User.first || User.new(name: 'User', email: "user3@example.com", password: '123456')
  branch_one = Branch.create(city: 'New York')
  room_one = Room.create(branch: branch_one, name: 'Room One', guest: 2, beds: 1, description: 'This is a room.',
                         photo: 'https://www.ikea.com/mx/en/images/products/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5.jpg',
                         cost: 100, reserved: false)
  reservation = Reservation.create(user: user_one, reservation_date: '2023-08-23', city: room_one.branch.city,
                                   total_cost: 1000)

  it 'is valid with valid parameters' do
    expect(reservation).to be_valid
  end

  it 'is not valid without a reservation date' do
    reservation.reservation_date = nil
    expect(reservation).to_not be_valid
  end

  it 'is not valid without a city' do
    reservation.city = nil
    expect(reservation).to_not be_valid
  end

  it 'is not valid without specifying the total cost' do
    reservation.total_cost = nil
    expect(reservation).to_not be_valid
  end

  it 'is not valid if the total cost is not greater than 0' do
    reservation.total_cost = 0
    expect(reservation).to_not be_valid
  end

  it 'belongs to a user' do
    expect(reservation.user).to eq(user_one)
  end

  it 'has many reservation_rooms' do
    expect(reservation).to respond_to(:reservation_rooms)
  end

  it 'has many rooms through reservation_rooms' do
    expect(reservation).to respond_to(:rooms)
  end

  it 'destroys reservation' do
    expect { reservation.destroy }.to change { Reservation.count }.by(-1)
  end
end
