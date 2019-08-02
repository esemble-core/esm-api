require 'rails_helper'


RSpec.describe EventType, type: :model do
  let!(:projects) { create_list(:project, 10) }
  let!(:users) { create_list(:user, 1) }
  let!(:event_types) { create_list(:event_type, 5) }
  let!(:tasks) { create_list(:task, 5) }
  let!(:verifiable_task_events) { create_list(:verifiable_task_event, 3) }

end