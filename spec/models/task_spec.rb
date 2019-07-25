require 'rails_helper'


RSpec.describe Task, type: :model do
  let!(:projects) { create_list(:project, 10) }
  let!(:users) { create_list(:user, 1) }
  let!(:tasks) { create_list(:task, 5) }

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

end