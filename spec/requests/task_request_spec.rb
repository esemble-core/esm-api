require 'rails_helper'

RSpec.describe 'Tasks API', type: :request do
  let!(:projects) { create_list(:project, 10) }
  let!(:users) { create_list(:user, 1) }
  let!(:tasks) { create_list(:task, 5) }
  let!(:tasks_fundings) { create_list(:task_funding, 2) }
  let!(:event_types) { create_list(:event_type, 2)}
  let!(:verifiable_task_events) { create_list(:verifiable_task_event, 3) }
  let!(:task_event_verifications) { create_list(:task_event_verification, 2) }


  describe '/tasks API' do
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
      p1 = Project.find(2)
      p1.tasks.create(name: "my task 1")
      p1.tasks.create(name: "my task 2")
      p1.save
      get('/api/v1/projects/2', params: {with_tasks: 'true'})
      expect(resp_json['tasks'].size).to be_eql(2)
    end


    it 'creates tasks for a project id' do
      pre = Project.find(1).tasks.count
      post('/api/v1/tasks/', params: {project_id: '1', name: 'my awesome task'})
      post = Project.find(1).tasks.count
      expect(post).to be_eql(pre + 1)
    end


    it 'does not create tasks with an invalid project id' do
      bad_id = '100'
      expect{Project.find(bad_id)}.to raise_error( ActiveRecord::RecordNotFound)
      pre = Task.all.count
      post('/api/v1/tasks/', params: {project_id: bad_id, name: 'should not be created'})
      expect(resp_json['status']).to be_eql('ERROR')
      post = Task.all.count
      expect(pre).to be_eql(post)
    end


    it 'has a many to many between users and tasks' do 
      user_id = 1
      task_id = 1
      u = User.find(user_id)

      pre_count = u.tasks.count
      post('/api/v1/user_working_on_task', params: { user_id: user_id, task_id: task_id })
      post_count = u.tasks.count
      expect(post_count).to be_eql(pre_count + 1)
    end


    it 'returns the task for the id and includes users' do
        t1 = Task.find(1)
        u1 = User.find(1)
        t1.users << u1
        t1.save
        expect(t1.users.count).to be_eql(1)
        get '/api/v1/tasks/1'
        expect(resp_json['users_working_on'].size).to be_eql(1)
    end


    it 'returns the token payouts for the task' do 
      pre = TaskFunding.all.count
      post('/api/v1/task_fundings/', params: 
          { token_address: '0x2956356cd2a2bf3202f771f50d3d14a367b48070', 
            token_name: 'Ethereum', 
            token_symbol: 'ETH', 
            amount: 12.5, 
            task_id: 1
          }
        )
      post = TaskFunding.all.count
      expect(post).to be_eql(pre + 1)
      get '/api/v1/tasks/1'
      expect(resp_json['task_fundings'].size).to be_eql(post)
    end


    it 'get events and event verifications' do
      get('/api/v1/tasks/1')
      events = resp_json['events']
      expect(events).not_to eql('')
    end


    it 'will add events' do
      pre = VerifiableTaskEvent.all.count
      post('/api/v1/create_task_event/',
        params: {
            attachment_link_test: 'http://linksomewhere.co',
            event_type_id: 1,
            task_id: 1
          })
      post = VerifiableTaskEvent.all.count
      expect(post).to be_eql(pre + 1)
    end


    it 'will add event verifications' do
      pre = TaskEventVerification.all.count
      post('/api/v1/create_event_verification/',
        params: {
          verifiable_task_event_id: 1,
          user_id: 1,
          comment: 'This is a comment, i think'
        })
      post = TaskEventVerification.all.count
    end


    it 'can look up the right event type for the id' do
      get('/api/v1/task_event_types/')
      expect(resp_json['task_event_types'].size).to be_eql(2)
    end

    it 'can be marked as complete' do
      get('/api/v1/tasks/1')
      expect(resp_json['task']['done']).to be_eql(false)
      post('/api/v1/set_task_completed', params: {id: 1})
      get('/api/v1/tasks/1')
      expect(resp_json['task']['done']).to be_eql(true)
    end
  end
end