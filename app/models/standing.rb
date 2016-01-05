class Standing < ActiveRecord::Base
  belongs_to :team
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
