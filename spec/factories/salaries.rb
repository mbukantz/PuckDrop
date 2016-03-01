# == Schema Information
#
# Table name: salaries
#
#  id         :integer          not null, primary key
#  year_0     :integer
#  year_1     :integer
#  year_2     :integer
#  year_3     :integer
#  year_4     :integer
#  year_5     :integer
#  year_6     :integer
#  year_7     :integer
#  year_8     :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :salary do
    year_0 1
    year_1 1
    year_2 1
    year_3 1
    year_4 1
    year_5 1
    year_6 1
    year_7 1
    year_8 1
  end
end
