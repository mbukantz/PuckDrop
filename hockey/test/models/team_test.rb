# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  city       :string
#  name       :string
#  coach      :string
#  arena      :string
#  league_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
