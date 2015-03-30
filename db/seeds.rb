5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password_digest: Faker::Internet.password
    )
end

User.create(
  name: "will",
  email: "will@will.com",
  password_digest: "will"
  )