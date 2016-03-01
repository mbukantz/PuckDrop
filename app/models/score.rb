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

class Score < ActiveRecord::Base
  def hometeam
    Team.find(self.hometeam_id).full_name
  end

  def awayteam
    Team.find(self.awayteam_id).full_name
  end

  def time_left
    time = self.time_remaining
    first = time.to_i
    last = ((time % 1) * 60).to_i
      if last < 10
        last = "0#{last}"
      end
    "#{first}:#{last}"
  end

  def period_board
    period = self.period
    if period == 1
      "1st Period"
    elsif period == 2
      "2nd Period"
    elsif period == 3
      "3rd Period"
    end
  end
end
