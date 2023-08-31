require 'swagger_helper'

RSpec.describe 'reservations', type: :request do
  path '/users/{user_id}/reservations' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    get 'Retrieve all reservations' do
      tags 'Reservations'
      produces 'application/json'
      response '200', 'Successful, reservations found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer, example: 1 }, reservation_date: { type: :date, example: '2023-08-23' },
                   city: { type: :string, example: 'New York' }, total_cost: { type: :integer, example: 100 },
                   user_id: { type: :integer, example: 1 }, created_at: { type: :date, example: '2023-08-20' },
                   updated_at: { type: :date, example: '2023-08-20' },
                   rooms: {
                     type: :array,
                     items: {
                       type: :object, example: {
                         id: 1, name: 'Room 1', guest: 2, beds: 1, description: 'Room 1 description',
                         photo: 'room.jpg', cost: 100, reserved: true, branch_id: 1
                       }
                     }
                   }
                 },
                 required: %w[id reservation_date city total_cost user_id created_at updated_at rooms]
               }
        let(:user_id) { '1' }
        run_test!
      end
    end
  end

  path '/users/{user_id}/reservations' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    post 'Create a reservation' do
      tags 'Reservations'
      consumes 'application/json'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          reservation: {
            type: :object,
            properties: {
              reservation_date: { type: :date, example: '2023-08-23' },
              city: { type: :string, example: 'New York' },
              total_cost: { type: :integer, example: 998 },
              user_id: { type: :integer, example: 1 },
              room_ids: { type: :array, example: [3] }
            }
          }
        },
        required: %w[reservation_date city total_cost user_id room_ids]
      }
      response '201', 'Reservation was created successfully' do
        let(:user_id) { '1' }
        run_test!
      end
    end
  end

  path '/users/{user_id}/reservations/{id}' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'reservation_id'

    get 'Show reservation details' do
      tags 'Reservations'
      produces 'application/json'
      response '200', 'Success, room was found' do
        schema type: :object,
               properties: {
                 id: { type: :integer, example: 1 }, reservation_date: { type: :date, example: '2023-08-23' },
                 city: { type: :string, example: 'New York' }, total_cost: { type: :integer, example: 998 },
                 user_id: { type: :integer, example: 1 }, created_at: { type: :date, example: '2023-08-20' },
                 updated_at: { type: :date, example: '2023-08-20' },
                 rooms: {
                   type: :array,
                   items: {
                     type: :object, example: {
                       id: 1, name: 'Room 1', guest: 2, beds: 1, description: 'Room 1 description',
                       photo: 'room.jpg', cost: 100, reserved: true, branch_id: 1
                     }
                   }
                 }
               },
               required: %w[id reservation_date city total_cost user_id created_at updated_at rooms]
        let(:user_id) { '1' }
        let(:id) { '1' }
        run_test!
      end
    end
  end

  path '/users/{user_id}/reservations/{id}' do
    parameter name: 'user_id', in: :path, type: :string, description: 'user_id'
    parameter name: 'id', in: :path, type: :string, description: 'reservation id'

    delete 'Delete reservation' do
      tags 'Reservations'
      response '204', 'Success, no content' do
        let(:user_id) { '1' }
        run_test!
      end
    end
  end
end
