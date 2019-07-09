FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    eth_addr { Faker::Alphanumeric.alpha(16) }
    uuid { Faker::Alphanumeric.alpha(8) }
  end
end