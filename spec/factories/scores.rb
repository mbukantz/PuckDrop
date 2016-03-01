# == Schema Information
#
# Table name: scores
#
#  id                 :integer          not null, primary key
#  hometeam_id        :integer
#  awayteam_id        :integer
#  home_goals         :integer
#  away_goals         :integer
#  period             :integer
#  time_remaining     :float
#  hometeam_league_id :integer
#  awayteam_league_id :integer
#  date               :datetime
#

FactoryGirl.define do
  factory :score do
    
  end

end
