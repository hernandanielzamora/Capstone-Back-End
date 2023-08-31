require 'swagger_helper'

RSpec.describe 'users/registrations', type: :request do
  path '/sign_up' do
    post 'Create registration' do
      tags 'Registrations'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              name: { type: :string, example: 'User' },
              email: { type: :string, example: 'unregistered@email' },
              password: { type: :string, example: 'password' }
            }
          }
        },
        required: %w[name email password]
      }

      response '200', 'Signed up sucessfully' do
        run_test!
      end

      response '422', "User couldn't be created successfully." do
        run_test!
      end
    end
  end
end
