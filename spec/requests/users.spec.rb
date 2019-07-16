# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  # initialize test data 
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  # Test suite for GET /users
  describe '/users API' do
    #before { get '/api/v1/users' }

    it 'returns users' do
      # Note `json` is a custom helper to parse JSON responses
      get '/api/v1/users'
      expect(json).not_to be_empty 
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      get '/api/v1/users'
      expect(response).to have_http_status(200)
    end
end