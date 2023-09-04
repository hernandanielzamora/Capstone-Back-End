require_relative '../rails_helper'
require 'rspec/json_expectations'

RSpec.describe ReservationsController, type: :request do
  user_one = User.first || User.new(name: 'User', email: 'user1@example.com', password: '123456', role: 'admin')
  before { sign_in user_one }
  branch_one = Branch.create(city: 'New York')
  branch_one.save!
  room_one = Room.create(branch: branch_one, name: 'Room One', guest: 2, beds: 1, description: 'This is a room.',
                         photo: 'https://www.ikea.com/mx/en/images/products/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5.jpg',
                         cost: 100, reserved: false)
  room_one.save!
  reservation = Reservation.first || Reservation.create(user: user_one, reservation_date: '2023-08-23',
                                                        city: 'new york', total_cost: 200)
  reservation.save!

  describe 'GET /users/:user_id/reservations' do
    it 'returns a list of reservations for a user' do
      reservation.reservation_rooms.create(room: room_one)
      get "/users/#{user_one.id}/reservations"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include_json(
        [
          { id: reservation.id, user_id: user_one.id }
        ]
      )
    end
  end

  describe 'POST /users/:user_id/reservations' do
    it 'creates a new reservation' do
      reservation_params = {
        reservation_date: Date.today,
        city: 'Miami',
        total_cost: 200,
        user_id: user_one.id,
        room_ids: [room_one.id]
      }
      post "/users/#{user_one.id}/reservations", params: { reservation: reservation_params }
      expect(response).to have_http_status(:created)
    end
  end

  it 'returns unprocessable_entity status when reservation creation fails' do
    invalid_params = { reservation_date: nil, user_id: user_one.id }
    post "/users/#{user_one.id}/reservations", params: { reservation: invalid_params }
    expect(response).to have_http_status(:unprocessable_entity)
  end

  describe 'GET /users/:user_id/reservations/:id' do
    it 'returns a single reservation for a user' do
      get "/users/#{user_one.id}/reservations/#{reservation.id}"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include_json(
        id: reservation.id,
        user_id: user_one.id
      )
    end
  end

  describe 'DELETE /users/:user_id/reservations/:id' do
    it 'deletes a reservation and updates room status' do
      delete "/users/#{user_one.id}/reservations/#{reservation.id}"

      expect(response).to have_http_status(:no_content)
      expect(Room.find(room_one.id).reserved).to be(false)
    end
  end

  it 'returns unprocessable_entity status when deletion fails' do
    allow_any_instance_of(Reservation).to receive(:destroy).and_return(false)
    delete "/users/#{user_one.id}/reservations/#{reservation.id}"
    expect(response).to have_http_status(:unprocessable_entity)
  end
end
