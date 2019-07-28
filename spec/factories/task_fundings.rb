FactoryBot.define do
  factory :task_funding do
    token_address { Faker::Blockchain::Ethereum.address }
    token_symbol { "ETH" }
    token_name { "Ethereum" }
    amount { 5.2 }
    task_id { 1 }
  end
end