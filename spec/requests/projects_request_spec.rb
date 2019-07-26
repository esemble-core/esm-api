# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Projects API', type: :request do
  let!(:projects) { create_list(:project, 10) }
  let!(:users) { create_list(:user, 1) }
  let!(:tasks) { create_list(:task, 5) }

  describe '/projects API' do
    it 'returns projects' do
      get '/api/v1/projects'
      expect(resp_json).not_to be_empty 
      expect(resp_json['data'].size).to be_eql(10)
    end

    it 'create a project' do
      pre = Project.count
      post('/api/v1/projects', 
          params: {name: 'P1', 
          description: 'This project so far does nothing',
          lifecycle: 1,
          funding: 0
        })
      post = Project.count
      expect(post).to be_eql(pre + 1)
    end

    it 'shows a project' do
      p1 = Project.find('1')
      get '/api/v1/projects/1'
      expect(resp_json['data']['name']).to be_eql(p1.name)
    end

    it 'destroys a project' do
      pre = Project.count
      delete('/api/v1/projects/1')
      post = Project.count
      expect(post).to be_eql(pre - 1)
    end

    it 'updates a project' do 
      get '/api/v1/projects/2'
      pre = resp_json['data']['name']
      put('/api/v1/projects/2', params: {name: 'MyNewProjectName'})
      get '/api/v1/projects/2'
      post = resp_json['data']['name']
      expect(post).to be_eql('MyNewProjectName')
    end

   
  end
end