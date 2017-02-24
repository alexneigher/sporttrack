# Create some users

40.times do
  # grab a random password
  password = SecureRandom.base64(10)
  # build a user
  User.create!(
                name: Faker::Name.name,
                email: Faker::Internet.email,
                password: password,
                password_confirmation: password,
                height_meters: Faker::Number.decimal(1, 2),
                weight_kilograms: Faker::Number.number(2),
                units_preference: :imperial
              )
end