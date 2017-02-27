# Create some users

40.times do
  User.create(
                name: Faker::Name.name,
                email: Faker::Internet.email,
                height_meters: Faker::Number.decimal(1, 2),
                weight_kilograms: Faker::Number.number(2),
                units_preference: :imperial
              )
end

#create some random organizations
40.times do 
  Organization.create(name: Faker::Team.name)
end

# Create a bunch of teams
organization_ids = (Organization.first.id..Organization.last.id)
80.times do 
  Team.create(name: Faker::Team.name, organization_id: rand(organization_ids))
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


# generate arbitrary sports
sport_names = ['soccer', 'football', 'baseball', 'lacrosse', 'running', 'swimming', 'rowing', 'cycling', 'chess', 'basketball']

User.all.each do |u|
  team_ids = u.teams.pluck(:id)
  4.times do
    Sport.create(user: u, team_id: team_ids.sample, name: sport_names.sample, participation_date: Date.current, participation_hours: Faker::Number.number(2))
  end
  u.update(total_participation_hours: u.sports.sum(:participation_hours))
end




