require 'rails_helper'


RSpec.describe User, type: :model do
 
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:eth_addr) }
  it { should validate_presence_of(:uuid) }
end