# Create some users

40.times do
  # grab a random password
  password = SecureRandom.base64(10)
  # build a user
  User.create(
                name: Faker::Name.name,
                email: Faker::Internet.email,
                password: password,
                password_confirmation: password,
                height_meters: Faker::Number.decimal(1, 2),
                weight_kilograms: Faker::Number.number(2),
                units_preference: :imperial
              )
end

# Create a bunch of teams
80.times do 
  Team.create(name: Faker::Team.name)
end


# Make a bunch of random team/user combos
users = User.order(:id).all
user_id_range = (users.first.id..users.last.id)

teams = Team.order(:id).all
team_id_range = (teams.first.id..teams.last.id)

200.times do 
  user = User.find(rand(user_id_range))
  user.teams << Team.find(rand(team_id_range))
  user.save
end