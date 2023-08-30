require 'swagger_helper'

RSpec.describe 'rooms', type: :request do
  path '/rooms' do
    parameter name: :reserved, in: :query, type: :boolean, description: 'reserved'
    parameter name: :branch_id, in: :query, type: :integer, description: 'branch_id'
    get 'Retrieve all rooms' do
      tags 'Rooms'
      produces 'application/json'
      response '200', 'Successful, rooms found' do
        schema type: :array, items: {
          type: :object, properties: {
                           id: { type: :integer, example: 1 }, name: { type: :string, example: 'Room one' },
                           guest: { type: :integer, example: 2 }, beds: { type: :integer, example: 1 },
                           description: { type: :string, example: 'This is a room.' },
                           photo: { type: :string, example: 'room.jpg' }, cost: { type: :integer, example: 100 },
                           reserved: { type: :boolean, example: false },
                           branch: { type: :object,
                                     properties: { id: { type: :integer, example: 1 },
                                                   city: { type: :string, example: 'New York' } } }
                         },
          required: %w[id name guest beds description photo cost reserved branch]
        }
        run_test!
      end
    end
  end

  path '/rooms' do
    post 'Create a room' do
      tags 'Rooms'
      consumes 'application/json'
      parameter name: :room, in: :body, schema: {
        type: :object, properties: {
                         room: {
                           type: :object, properties: {
                             name: { type: :string, example: 'Room VIP' }, guest: { type: :integer, example: 4 },
                             beds: { type: :integer, example: 2 },
                             description: { type: :string, example: 'Room created from the API docs' },
                             photo: { type: :string, example: 'Valid url' }, cost: { type: :integer, example: 1000 },
                             reserved: { type: :boolean, example: false }, branch_id: { type: :integer, example: 1 }
                           }
                         }
                       },
        required: %w[name guest beds description photo cost reserved branch_id]
      }
      response '201', 'Room was created successfully' do
        run_test!
      end
    end
  end

  path '/rooms/{id}' do
    parameter name: :id, in: :path, type: :string, description: 'id'

    get 'Show room details' do
      tags 'Rooms'
      produces 'application/json'

      response '200', 'Success, room was found' do
        schema type: :object,
               properties: {
                 id: { type: :integer, example: 1 }, name: { type: :string, example: 'Room one' },
                 guest: { type: :integer, example: 2 }, beds: { type: :integer, example: 1 },
                 description: { type: :string, example: 'This is a room.' },
                 photo: { type: :string, example: 'room.jpg' }, cost: { type: :integer, example: 100 },
                 reserved: { type: :boolean, example: false },
                 branch: { type: :object,
                           properties: { id: { type: :integer, example: 1 },
                                         city: { type: :string, example: 'New York' } } }
               },
               required: %w[id name guest beds description photo cost reserved branch]

        let(:id) { '1' }
        run_test!
      end
    end

    delete 'Delete room' do
      tags 'Rooms'

      response '204', 'Success, no content' do
        run_test!
      end
    end
  end
end
