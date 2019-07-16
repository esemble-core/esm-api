FactoryBot.define do
  factory :project do
    name { Faker::Ancient.hero }
    description { Faker::Quote.yoda }
    lifecycle { Faker::Number.number(1) }
    funding { Faker::Number.number(1) }
  end
end

