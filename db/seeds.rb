# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

v = 100 #games/day
w = 50000 #games/schedules
x = 100 #teams
y = 2000 #players
z = 5 #leagues



years = Year.create([{id: 2013},{id: 2014}, {id: 2015}])


Headline.create([{name:'Rangers win the Stanley Cup',picture:"rangers_cup.jpg" ,body: Faker::Lorem.paragraph(2, true, 4)},{name:'Matteau is unsung hero',picture:"matteau.jpg" ,body: Faker::Lorem.paragraph(2, true, 4)},{name:'Leetch takes home MVP',picture:"leetch_conn_smythe.jpg" ,body: Faker::Lorem.paragraph(2, true, 4)},{name:'Linden valient in defeat',picture:"linden.jpg" ,body: Faker::Lorem.paragraph(2, true, 4)},{name:'Will Keenan depart for Detroit?',picture:"keenan.jpg" ,body: Faker::Lorem.paragraph(2, true, 4)},{name:'Neil Smith: The Mastermind',picture:"neil_smith.jpg" ,body: Faker::Lorem.paragraph(2, true, 4)},{name:'Pat Quinn falls short again',picture:"pat_quinn.jpg" ,body: Faker::Lorem.paragraph(2, true, 4)},{name:'The Russian Rocket',picture:"bure.jpg" ,body: Faker::Lorem.paragraph(2, true, 4)},{name:'MacTavish to hang it up',picture:"mactavish.jpg" ,body: Faker::Lorem.paragraph(2, true, 4)}])

Video.create([{title:'Rangers win Stanley Cup',caption:"The 1993-94 New York Rangers hold on to beat the Vancouver Canucks for their first cup in 54 years.",short_url:"https://youtu.be/Dr0m5bWAgk0",url:"https://www.youtube.com/watch?v=Dr0m5bWAgk0"},{title:'Matteau double OT goal',caption:"Stephan Matteau goal in Game 7 sent the Rangers to the Cup Finals, and it is the moment of the playoffs",short_url:"https://youtu.be/9vKvKMmOwuI",url:"https://www.youtube.com/watch?v=9vKvKMmOwuI"},{title:'Mark Messier Guarantee',caption:"Mark Messier said 'We will win tonight', and he delivers with a hat trick to fight off elimination",short_url:"https://youtu.be/XMBqmyi5LRM",url:"https://www.youtube.com/watch?v=XMBqmyi5LRM"}])


z.times do |i|
  league = League.new
  league.name = Faker::App.name
  league.commissioner = Faker::Name.name
  league.save
end

x.times do |i|
  team = Team.new
  team.city = Faker::Team.state
  team.name = Faker::Team.creature
  team.coach = Faker::Name.name
  team.arena = Faker::University.name
  team.league_id = rand(1..z)
  team.save
end

w.times do |i|
  schedule = Schedule.new
  schedule.hometeam = rand(1..x)
  away = rand(1..x)
    if away != schedule.hometeam
      schedule.awayteam = away
    else
      schedule.awayteam = rand(1..x)
    end
  schedule.date = Faker::Date.between(3.years.ago, Faker::Date.forward(365))
  if schedule.date < Date.today
    schedule.homegoals = rand(0..6)
    schedule.awaygoals = rand(0..6)
  end
  schedule.league_id = rand(1..5)
  schedule.hometeam_league_id = Team.find(schedule.hometeam).league_id
  schedule.awayteam_league_id = Team.find(schedule.awayteam).league_id
  schedule.save
end

y.times do |i|
  standing = Standing.new
  standing.team_id = 1 + i
  standing.year_id = rand(2013..2015)
  standing.save
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
    salary = Salary.new
      salary.year_0 = [500000,1000000,1250000,1500000,1750000,2000000,2250000,2500000,2750000,3000000,3250000,3500000,3750000,4000000,4250000,4500000,5000000,5250000,5500000,6000000,6500000,7000000,8000000,9000000,1000000].sample
      salary.year_1 =
        case rand(100) + 1
        when 1..85 then
          if salary.year_0 != ""
            salary.year_0
          end
        when 86..100 then ""
        end
      salary.year_2 =
        if salary.year_1 != ""
          case rand(100) + 1
          when 1..65 then salary.year_1
          when 66..100 then ""
          end
        else
          ""
        end
      salary.year_3 =
        if salary.year_2 != ""
          case rand(100) + 1
          when 1..50 then salary.year_2
          when 51..100 then ""
          end
        else
          ""
        end
        salary.year_4 =
          if salary.year_3 != ""
            case rand(100) + 1
            when 1..45 then salary.year_3
            when 46..100 then ""
            end
          else
            ""
          end
          salary.year_5 =
            if salary.year_4 != ""
              case rand(100) + 1
              when 1..35 then salary.year_4
              when 36..100 then ""
              end
            else
              ""
            end
          salary.year_6 =
            if salary.year_5 != ""
              case rand(100) + 1
              when 1..30 then salary.year_5
              when 31..100 then ""
              end
            else
              ""
            end
          salary.year_7 =
            if salary.year_6 != ""
              case rand(100) + 1
              when 1..20 then salary.year_6
              when 21..100 then ""
              end
            else
              ""
            end
          salary.year_8 =
            if salary.year_7 != ""
              case rand(100) + 1
              when 1..15 then salary.year_7
              when 16..100 then ""
              end
            else
              ""
            end
    salary.player_id = i + 1
    salary.save
  end

  y.times do |i|
    statistic = Statistic.new
    statistic.player_id = i + 1
    if statistic.player.position != "Goalie"
      statistic.games = rand(70..82)
      statistic.goals = rand(7..55)
      statistic.assists = rand(10..70)
      statistic.plus_minus = rand(-20..30)
      statistic.atoi = rand(10..26)
      statistic.pims = rand(10..100)
      statistic.player_id = i + 1
      statistic.year_id = rand(2013..2015)
    else
      statistic.wins = rand(20..42)
      statistic.losses = rand(14..35)
      statistic.gaa = rand(2.00..3.10)
      statistic.saves = rand(300..500)
      statistic.shots = rand((1.07*statistic.saves)..(1.11*statistic.saves))
      statistic.shutouts = rand(1..8)
      statistic.player_id = i + 1
      statistic.year_id = rand(2013..2015)
    end
    statistic.save
  end

  v.times do |i|
    score = Score.new
    score.hometeam_id = rand(1..x)
    away = rand(1..x)
    if away != score.hometeam_id
      score.awayteam_id = away
    else
      score.awayteam_id = rand(1..x)
    end
    score.home_goals = rand(0..6)
    score.away_goals = rand(0..6)
    score.period = rand(1..3)
    score.time_remaining = rand(0.00..20.00)
    score.hometeam_league_id = Team.find(score.hometeam_id).league_id
    score.awayteam_league_id = Team.find(score.awayteam_id).league_id
    score.save
  end
