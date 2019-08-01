FactoryBot.define do
  factory :task_event_verification do
    verifiable_task_event_id { 1 }
    user_id { 1 }
    comment { Faker::TvShows::MichaelScott.quote }
  end
end






