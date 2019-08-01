require 'rails_helper'


RSpec.describe Lookup, type: :model do
  let!(:projects) { create_list(:project, 10) }
  let!(:users) { create_list(:user, 1) }
  let!(:lookups) { create_list(:lookup, 5) }
  let!(:tasks) { create_list(:task, 5) }
  let!(:verifiable_task_events) { create_list(:verifiable_task_event, 3) }

  it 'can do a simple lookup with a key' do 
    Lookup.create(key: "mykey", value: "myvalue")
    value = Lookup.for("mykey")
    expect(value).to be_eql("myvalue")
  end

  it 'can do a lookup correctly on a linked lookup' do 
    event_type_lookup = "1"
    event_type_value = "Design Submission"
    Lookup.create(key: event_type_lookup, value: event_type_value, entity: 'VerifiableTaskEvent')

    v = VerifiableTaskEvent.find(1)
  end
end