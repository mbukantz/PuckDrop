# == Schema Information
#
# Table name: standings
#
#  id         :integer          not null, primary key
#  games      :integer
#  wins       :integer
#  losses     :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StandingsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
end
