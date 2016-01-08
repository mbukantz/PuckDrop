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
#  year_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Statistic < ActiveRecord::Base
  belongs_to :player
  belongs_to :year

  def points
    if self.player.position != "Goalie"
      self.goals + self.assists
    end
  end

  def save_percentage
    if self.player.position == "Goalie"
      save_pct = self.saves.to_f / self.shots.to_f
      save_pct.round(3)
    end
  end
end
