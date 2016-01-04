# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

x = 100 #teams
y = 1000 #players
z = 5 #leagues

z.times do |i|
  league = League.new
  league.name = Faker::App.name
  league.commissioner = Faker::Name.name
  league.save
end

y.times do |i|
  standing = Standing.new
  standing.games = 82
  standing.wins = rand(30..55)
  standing.losses = 82 - standing.wins
  standing.team_id = 1 + i
  standing.save
end

x.times do |i|
  team = Team.new
    team.city = Faker::Team.state
    team.name = Faker::Team.creature
    team.coach = Faker::Name.name
    team.arena = Faker::University.name
    team.league_id = rand(1..5)
    team.save
  end

  y.times do |i|
    player = Player.new
    player.first_name = Faker::Name.first_name
    player.last_name = Faker::Name.last_name
    player.birthday = Faker::Date.between(35.years.ago,20.years.ago)
    player.height = rand(68..76)
    player.weight = rand(180..220)
    player.shoots = ["Left","Right"].sample
    player.position = ["Left Wing","Right Wing","Center","Defense","Defense","Goalie"].sample
    player.city = Faker::Address.city
    player.state = Faker::Address.state
    player.country = Faker::Address.country
    player.team_id = rand(1..x)
    player.save
  end

  y.times do |i|
    statistic = Statistic.new
    statistic.games = rand(70..82)
    statistic.goals = rand(7..55)
    statistic.assists = rand(10..70)
    statistic.points = statistic.goals + statistic.assists
    statistic.plus_minus = rand(-20..30)
    statistic.atoi = rand(10..26)
    statistic.pims = rand(10..100)
    statistic.player_id = i + 1
    statistic.save
  end
