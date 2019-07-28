require 'rails_helper'

RSpec.describe TaskFunding, type: :model do
  let!(:projects) { create_list(:project, 10) }
  let!(:users) { create_list(:user, 1) }
  let!(:tasks) { create_list(:task, 5) }
  let!(:tasks_fundings) { create_list(:task_funding, 2) }

  it { should belong_to(:task) } 
  it { should validate_presence_of(:token_address) }
  it { should validate_presence_of(:token_symbol) }
  it { should validate_presence_of(:amount) }

  it 'returns the tokenfundings for a token' do
    t1 = Task.find(1)
    funding_count = 2
    fundings = t1.task_fundings
    expect(funding_count).to be_eql(funding_count)
  end
end
