# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Users API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  # Test suite for GET /users
  describe '/users API' do
    #before { get '/api/v1/users' }

    it 'returns users' do
      # Note `json` is a custom helper to parse JSON responses
      get '/api/v1/users'
      expect(resp_json).not_to be_empty 
      expect(resp_json['data'].size).to be_eql(10)
    end

    it 'returns status code 200' do
      get '/api/v1/users'
      expect(response).to have_http_status(200)
    end

    it 'shows a user' do
      get '/api/v1/users/1'
      expect(resp_json['data']['name']).not_to be_empty
    end

    it 'create a user' do
      pre = User.count
      post('/api/v1/users', params: {name: 'GiGi', eth_addr:'0x7890', uuid:'7-8-9-0'})
      post = User.count
      expect(post).to be_eql(pre + 1)
    end

    it 'destroys a user' do
      pre = User.count
      delete('/api/v1/users/1')
      post = User.count
      expect(post).to be_eql(pre - 1)
    end

    it 'updates a user' do 
      get '/api/v1/users/2'
      pre = resp_json['data']['name']
      put('/api/v1/users/2', params: {name: 'MyNewName'})
      get '/api/v1/users/2'
      post = resp_json['data']['name']
      expect(post).to be_eql('MyNewName')
    end
  end
end