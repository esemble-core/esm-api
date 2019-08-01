FactoryBot.define do
  factory :verifiable_task_event do
    attachment_link_text { "http://dropbox.com/document/fk3093jkj"}
    event_type { 1 }
    task_id { 1 }
  end
end






