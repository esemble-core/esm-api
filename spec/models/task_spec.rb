require 'rails_helper'


RSpec.describe Task, type: :model do
  let!(:projects) { create_list(:project, 10) }
  let!(:users) { create_list(:user, 1) }
  let!(:tasks) { create_list(:task, 5) }
  let!(:verifiable_task_events) { create_list(:verifiable_task_event, 3) }
  let!(:task_event_verifications) { create_list(:task_event_verification, 2) }


  it { should belong_to(:project) } 
  it { should validate_presence_of(:name) }


  it 'has a many to many between users and tasks' do 
    user = User.find(1)
    pre = user.tasks.count
    t1 = Task.find(1)
    pre_task = t1.users.count
    user.tasks << t1
    expect(user.tasks.count).to be_eql(pre + 1)
    expect(t1.users.count).to be_eql(pre_task + 1)
  end


  it 'has task task events' do 
    t1 = Task.find(1)
    events = t1.verifiable_task_events
    expect(events.count).to be_eql(3)
    verified = t1.verifiable_task_events.first.task_event_verifications
    expect(verified.count).to be_eql(2)

    e2 = t1.events
    expect(e2.count).to be_eql(3)

    v2 = e2.first.verifications
    expect(v2.count).to be_eql(2)
  end

end