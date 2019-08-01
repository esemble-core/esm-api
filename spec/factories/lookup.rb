FactoryBot.define do
  factory :lookup do
    key { Faker::Lorem.word }
    value { Faker::Lorem.word }
    entity { 'VerifiableTaskEvent' }
  end
end