require_relative '../rails_helper'

RSpec.describe RoomsController, type: :request do
  user_one = User.first || User.new(name: 'User', email: 'user2@example.com', password: '123456', role: 'admin')
  user_one.save!
  before { sign_in user_one }
  branch_one = Branch.first || Branch.create(city: 'New York')
  branch_one.save!
  room_one = Room.first || Room.create(branch: branch_one, name: 'Room One', guest: 2, beds: 1, description: 'This is a room.',
                         photo: 'https://www.ikea.com/mx/en/images/products/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5.jpg',
                         cost: 100, reserved: false)
  room_one.save!
  room_two = Room.create(branch: branch_one, name: 'Room Two', guest: 3, beds: 1, description: 'This is a room.',
                         photo: 'https://www.ikea.com/mx/en/images/products/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5.jpg',
                         cost: 100, reserved: true)
  room_two.save!
  reservation = Reservation.create(user: user_one, reservation_date: '2023-08-23', city: 'new york', total_cost: 200)
  reservation.save!

  describe 'GET #index' do
    it 'returns a list of rooms' do
      get '/rooms'
      expect(response).to have_http_status(:success)
    end

    it 'returns a filtered list of rooms based on reserved status' do
      get '/rooms', params: { reserved: 'true' }
      expect(response).to have_http_status(:success)
      response_json = JSON.parse(response.body)
      response_json.each do |reservation_hash|
        expect(reservation_hash).to have_key('reserved')
        expect(reservation_hash['reserved']).to eq(true)
      end
    end
  end

  describe 'GET /rooms/:id' do
    it 'returns a single room' do
      get "/rooms/#{room_two.id}"
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /create' do
    it 'creates a new room' do
      room_params = {
        name: 'Room Three',
        guest: 4,
        beds: 4,
        description: 'This is a room.',
        photo: 'https://www.ikea.com/mx/en/images/products/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5.jpg',
        cost: '100.0',
        reserved: true,
        branch_id: branch_one.id
      }
      post '/rooms', params: { room: room_params }
      expect(response).to have_http_status(:created)
    end

    it 'returns unprocessable entity status on validation error' do
      room_params = {
        name: 'Room Three',
        guest: 4,
        beds: 4,
        description: 'This is a room.',
        photo: 'https://www.ikea.com/mx/en/images/products/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5.jpg',
        cost: '100.0',
        reserved: true
      }
      post '/rooms', params: { room: room_params }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'DELETE rooms' do
    it 'deletes a room by id' do
      delete "/rooms/#{room_one.id}"
      expect(response).to have_http_status(:no_content)
    end
  end
end
