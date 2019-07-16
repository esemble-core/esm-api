require 'rails_helper'

RSpec.describe 'UserSearch', type: :request do
  before {
    post('/api/v1/users', params: {name: 'MiMi', eth_addr:'0x1234', uuid:'1-2-3-4'})
  }

  it 'returns the right user' do
    get('/api/v1/usersearch', params: { eth_addr: '0x1234' })
    json = JSON.parse(response.body)
    expect(json).not_to be_empty
    expect(json['data']['name']).to be_eql('MiMi')
  end
end