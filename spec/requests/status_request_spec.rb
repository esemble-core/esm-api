# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Status API', type: :request do
  describe 'GET /status' do
    before { get '/api/v1/status' }

    it 'returns status success' do
      expect(resp_json).not_to be_empty
      expect(resp_json['status']).to eql('OK')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

end