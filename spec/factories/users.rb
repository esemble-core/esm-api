FactoryBot.define do
  factory :user do
    name { Faker::Lorem.word }
    eth_addr { Faker::Blockchain::Ethereum.address }
    uuid { Faker::Alphanumeric.alpha(8) }
    email { Faker::Internet.email }
  end
end