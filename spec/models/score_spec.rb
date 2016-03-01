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

require 'rails_helper'

RSpec.describe Score, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
