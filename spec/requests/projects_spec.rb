# spec/requests/users_spec.rb
require 'rails_helper'

RSpec.describe 'Projects API', type: :request do
  let!(:projects) { create_list(:project, 10) }

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

    it 'destroys its tasks when destroyed' do
      p1 = Project.create(name: "my Parent project", description: "my parent project desc")
      p1.save
      t1 = p1.tasks.create(name: "my task 1")
      t2 = p1.tasks.create(name: "my task 2")
      t1_id = t1.id
      t2_id = t2.id
      expect(p1.tasks.count).to be_eql(2)
      id = p1.id
      delete('/api/v1/projects/' + id.to_s)
      expect{Task.find(t1_id)}.to raise_error( ActiveRecord::RecordNotFound)
      expect{Task.find(t2_id)}.to raise_error( ActiveRecord::RecordNotFound)
    end

    it 'returns tasks for projects when asked' do
      p1 = Project.find(1)
      p1.tasks.create(name: "my task 1")
      p1.tasks.create(name: "my task 2")
      p1.save
      get('/api/v1/projects/1', params: {with_tasks: 'true'})
      puts resp_json
    end

  end
end