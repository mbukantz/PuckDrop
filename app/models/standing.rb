# == Schema Information
#
# Table name: selfs
#
#  id         :integer          not null, primary key
#  games      :integer
#  wins       :integer
#  losses     :integer
#  team_id    :integer
#  year_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Standing < ActiveRecord::Base
  belongs_to :team
  belongs_to :year
  has_many :schedules

  def wins
    Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", self.team.league_id, self.team.league_id, self.team.league_id).where("hometeam = ?",self.team_id).where("homegoals > awaygoals").count + Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", self.team.league_id, self.team.league_id, self.team.league_id).where("awayteam = ?",self.team_id).where("awaygoals > homegoals").count
  end

  def losses
    Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", self.team.league_id, self.team.league_id, self.team.league_id).where("hometeam = ?",self.team_id).where("homegoals < awaygoals").count + Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", self.team.league_id, self.team.league_id, self.team.league_id).where("awayteam = ?",self.team_id).where("awaygoals < homegoals").count
  end

  def goals_for
    Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", self.team.league_id, self.team.league_id, self.team.league_id).where("hometeam = ?",self.team_id).sum("homegoals") + Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", self.team.league_id, self.team.league_id, self.team.league_id).where("awayteam = ?",self.team_id).sum("awaygoals")
  end

  def goals_against
    Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", self.team.league_id, self.team.league_id, self.team.league_id).where("hometeam = ?",self.team_id).sum("awaygoals") + Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", self.team.league_id, self.team.league_id, self.team.league_id).where("awayteam = ?",self.team_id).sum("homegoals")
  end

  def games
    self.wins + self.losses
  end

  def win_percentage
    if self.wins == 0 && self.losses == 0
      0.00
    else
      (self.wins/ (self.wins + self.losses).to_f).round(3)
    end
  end

  def wins_and_losses_sum
    if self.wins + self.losses != self.games
      errors.add(:games, "Wins and Losses must equal Games")
    end
  end
end
