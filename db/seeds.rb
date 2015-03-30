User.create(
  name: "will",
  email: "will@will.com",
  password_digest: "will"
  )

5.times do
  Trip.create(
    user_id: 1,
    trip_name: Faker::App.name,
    city: Faker::Address.city,
    state: Faker::Address.state,
    )
end


25.times do
  Poi.create(
    trip_id: rand(1..5),
    poi_name: Faker::App.name,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip
    )
end


