require 'rails_helper'

RSpec.describe TaskEventVerification, type: :model do
  it { should belong_to(:verifiable_task_event) } 
end
