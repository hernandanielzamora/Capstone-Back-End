require 'rails_helper'

RSpec.describe 'CurrentUser', type: :request do
  path '/current_user' do
    get 'Retrieve the data of the current user' do
      tags 'Current User'
      produces 'application/json'
      security [bearer_auth: []]
      response '200', 'Success, User found' do
        schema type: :object,
               properties: {
                 id: { type: :integer, example: 1 },
                 email: { type: :string, example: 'unregistered@email' },
                 name: { type: :string, example: 'Name' },
                 role: { type: :string, example: 'user' }
               },
               required: %w[id email name role]
        run_test!
      end
      response '401', 'Unauthorized' do
        run_test!
      end
    end
  end
end
