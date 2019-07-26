require 'rails_helper'

RSpec.describe 'UserSearch', type: :request do
  before {
    post('/api/v1/users', params: {name: 'MiMi', eth_addr:'0x1234', uuid:'1-2-3-4', email:'mimi@email.com'})
    post('/api/v1/users', params: {name: 'CiCi', eth_addr:'0x5678', uuid:'5-6-7-8', email:'mimi@email.com'})
  }

  it 'returns the right user' do
    get('/api/v1/usersearch', params: { eth_addr: '0x1234' })
    expect(resp_json).not_to be_empty
    json = resp_json['data']
    expect(json['name']).to be_eql('MiMi')
  end

  it 'responds reasonably, when user not found' do
    get('/api/v1/usersearch', params: { eth_addr: '0x0' })
    expect(resp_json).not_to be_empty
    expect(resp_json['status']).to be_eql('FAIL')
    expect(response).to have_http_status(200)
  end
end