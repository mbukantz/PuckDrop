# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  hometeam   :string
#  awayteam   :string
#  date       :datetime
#  homegoals  :string
#  awaygoals  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :schedule do
    
  end

end
