# == Schema Information
#
# Table name: leagues
#
#  id           :integer          not null, primary key
#  name         :string
#  commissioner :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class LeagueTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
