require 'rails_helper'


RSpec.describe VerifiableTaskEvent, type: :model do
  it { should belong_to(:task) } 
  it { should have_many(:task_event_verifications)}
  it { should validate_presence_of(:event_type) }
end
