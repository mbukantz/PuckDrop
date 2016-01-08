# == Schema Information
#
# Table name: standings
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
  validate :wins_and_losses_sum

  def win_percentage
    (self.wins/ (self.wins + self.losses).to_f).round(3)
  end

  def wins_and_losses_sum
    if self.wins + self.losses != self.games
      errors.add(:league, "Wins and Losses must equal Games")
    end
  end
end
