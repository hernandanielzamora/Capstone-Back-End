require_relative '../rails_helper'

RSpec.describe BranchesController, type: :request do
  user_one = User.first || User.new(name: 'User', email: 'user@example.com', password: '123456')
  user_one.save!
  before { sign_in user_one }
  branch_three = Branch.create(city: 'New York')
  branch_three.save!
  branch_two = Branch.create(city: 'Miami')
  branch_two.save!

  describe 'GET /branches' do
    it 'returns a list of branches' do
      get '/branches'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include_json(
        [
          { city: 'New York' }
        ]
      )
    end
  end

  describe 'GET /branches/:id' do
    it 'returns a single branch by ID' do
      get "/branches/#{branch_three.id}"
      expect(response).to have_http_status(:ok)
      expect(response.body).to include_json(
        city: 'New York'
      )
    end
  end
end