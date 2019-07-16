# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Status API', type: :request do
 
  # Test suite for GET /users
  describe 'GET /status' do
    # make HTTP get request before each example
    before { get '/api/v1/status' }

    it 'returns some json' do
      # Note `json` is a custom helper to parse JSON responses
      json = JSON.parse(response.body)
      expect(json).not_to be_empty
    end

    it 'returns status success' do
      json = JSON.parse(response.body)
      expect(json['status']).to eql('OK')
    end


    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end