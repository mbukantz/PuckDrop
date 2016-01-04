# == Schema Information
#
# Table name: statistics
#
#  id         :integer          not null, primary key
#  games      :integer
#  goals      :integer
#  assists    :integer
#  points     :integer
#  plus_minus :integer
#  atoi       :float
#  pims       :integer
#  wins       :integer
#  losses     :integer
#  gaa        :float
#  saves      :integer
#  shots      :integer
#  shutouts   :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Statistic < ActiveRecord::Base
  belongs_to :player

  def points
    self.goals + self.assists
  end
end
