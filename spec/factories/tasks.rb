FactoryBot.define do
  factory :task do
    name { Faker::Lorem.word }
    project_id { 1 }
  end
end