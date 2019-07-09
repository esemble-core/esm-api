5.times do
  User.create({
    name: Faker::Name.name,
    eth_addr: Faker::Lorem.word,
    uuid: Faker::Lorem.word
  })
end


