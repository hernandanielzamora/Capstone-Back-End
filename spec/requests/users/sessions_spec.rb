require 'swagger_helper'

RSpec.describe 'users/sessions', type: :request do
  path '/login' do
    post 'Create session' do
      tags 'Sessions'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string, example: 'unregistered@email' },
              password: { type: :string, example: 'password' }
            }
          }
        },
        required: %w[name email password]
      }

      response '200', 'Logged in sucessfully.' do
        run_test!
      end

      response '401', 'Invalid Email or password.' do
        run_test!
      end
    end
  end

  path '/logout' do
    delete 'Delete/Close session' do
      tags 'Sessions'
      produces 'application/json'
      security [bearer_auth: []]
      response '200', 'Logged out sucessfully.' do
        run_test!
      end
      response '401', "Couldn't find an active session." do
        run_test!
      end
    end
  end
end
