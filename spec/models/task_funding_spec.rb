require 'rails_helper'

RSpec.describe TaskFunding, type: :model do
  it { should belong_to(:task) } 
  it { should validate_presence_of(:token_address) }
  it { should validate_presence_of(:token_symbol) }
  it { should validate_presence_of(:amount) }
end
