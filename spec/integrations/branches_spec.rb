require_relative '../rails_helper'

RSpec.describe BranchesController, type: :request do
  user_one = User.first || User.new(name: 'User', email: 'user@example.com', password: '123456', role: 'admin')
  user_one.save!
  before { sign_in user_one }

  if Branch.all.empty?
    Branch.create(city: 'New York')
    Branch.create(city: 'Miami')
  else
    branch_two = Branch.find(2)
  end

  branch_two = Branch.find(2)

  describe 'GET /branches' do
    it 'returns a list of branches' do
      get '/branches'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /branches/:id' do
    it 'returns a single branch by ID' do
      get "/branches/#{branch_two.id}"
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)).to eq(
        branch_two.as_json
      )
    end
  end

  describe 'POST /branches' do
    it 'creates a new branch' do
      branch_params = {
        city: 'Haiti'
      }
      post '/branches', params: { branch: branch_params }
      expect(response).to have_http_status(:created)
    end
  end
end
