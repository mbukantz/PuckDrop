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

class League < ActiveRecord::Base
  has_many :teams
  has_one :standings
end
