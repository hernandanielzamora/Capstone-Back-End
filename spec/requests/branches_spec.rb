require 'swagger_helper'

RSpec.describe 'branches', type: :request do
  path '/branches' do
    get 'Retrieve all branches' do
      tags 'Branches'
      produces 'application/json'
      security [bearer_auth: []]
      response '200', 'Success, branches found' do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer, example: 1 },
                   city: { type: :string, example: 'New York' }
                 },
                 required: %w[id city]
               }
      end
      response '401', 'Unauthorized'
    end
  end

  path '/branches/{id}' do
    parameter name: :id, in: :path, type: :string, description: 'id'

    get 'Retrieve a branch' do
      tags 'Branches'
      produces 'application/json'
      security [bearer_auth: []]
      response '200', 'Success, branch was found' do
        schema type: :object,
               properties: {
                 id: { type: :integer, example: 1 },
                 city: { type: :string, example: 'New York' }
               },
               required: %w[id city]
      end
      response '401', 'Unauthorized'
      response '404', 'Branch was not found' do
        schema type: :object,
               properties: {
                 status: { type: :integer, example: 404 },
                 error: { type: :string, example: 'Not Found' },
                 exception: { type: :string,
                              example: "#<ActiveRecord::RecordNotFound: Couldn't find Branch with 'id'=NaN>" }
               }
      end
    end
  end
end
