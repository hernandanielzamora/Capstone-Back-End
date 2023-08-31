require_relative '../rails_helper'

RSpec.describe Room, type: :model do
  user = User.create(name: 'User', email: "fredo#{rand(1...100)}@example.com", password: '123456')
  user.save!
  branch_one = Branch.create(city: 'New York')
  room_one = Room.create(branch: branch_one, name: 'Room One', guest: 2, beds: 1, description: 'This is a room.', 
    photo: 'https://www.ikea.com/mx/en/images/products/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5.jpg', 
    cost: 100, reserved: false)
  reservation = Reservation.create(user: user, reservation_date: '2023-08-23', city: room_one.branch.city, total_cost: 1000)
  reservation.save!
  reservation.reservation_rooms.create(room: @room_one)

  it 'is valid with valid attributes' do
    expect(room_one).to be_valid
  end

  it 'is not valid without a name' do
    room_one.name = nil
    expect(room_one).to_not be_valid
  end

  it 'is not valid without specifying the number of guests' do
    room_one.guest = nil
    expect(room_one).to_not be_valid
  end

  it 'is not valid if the number of guests is not an integer' do
    room_one.guest = 2.5
    expect(room_one).to_not be_valid
  end

  it 'is not valid if the number of guests is less than 1' do
    room_one.guest = 0
    expect(room_one).to_not be_valid
  end

  it 'is not valid without specifying the number of beds' do
    room_one.beds = nil
    expect(room_one).to_not be_valid
  end

  it 'is not valid if the number of beds is not an integer' do
    room_one.beds = 1.5
    expect(room_one).to_not be_valid
  end

  it 'is not valid without a description' do
    room_one.description = nil
    expect(room_one).to_not be_valid
  end

  it 'is not valid without a valid photo URL' do
    room_one.photo = 'invalid_url'
    expect(room_one).to_not be_valid
  end

  it 'is not valid without specifying the cost' do
    room_one.cost = nil
    expect(room_one).to_not be_valid
  end

  it 'is not valid if the cost is not greater than 0' do
    room_one.cost = -10.00
    expect(room_one).to_not be_valid
  end

  it 'is not valid with reserved set to nil' do
    room_one.reserved = nil
    expect(room_one).to_not be_valid
  end

  it 'belongs to a branch' do
    expect(room_one.branch).to eq(branch_one)
  end

  it 'has one reservation through reservation_room' do
    expect(room_one.reservation_room).to be_nil
    expect(room_one.reservation_room).to eq(nil)
  end

  it 'destroys associated reservation_room when destroyed' do
    expect { room_one.destroy }.to change { Room.count }.by(-1)
  end
end
