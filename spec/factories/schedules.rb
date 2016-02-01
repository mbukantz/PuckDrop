# == Schema Information
#
# Table name: schedules
#
#  id                 :integer          not null, primary key
#  hometeam           :integer
#  awayteam           :integer
#  date               :datetime
#  homegoals          :integer
#  awaygoals          :integer
#  league_id          :integer
#  hometeam_league_id :integer
#  awayteam_league_id :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryGirl.define do
  factory :schedule do
    
  end

end
