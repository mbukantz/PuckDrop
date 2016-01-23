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
  has_many :schedules
  validate :wins_and_losses_sum
  validates :wins, presence: true
  validates :losses, presence: true

  def win_percentage
    (self.wins/ (self.wins + self.losses).to_f).round(3)
  end

  def wins_and_losses_sum
    if self.wins + self.losses != self.games
      errors.add(:games, "Wins and Losses must equal Games")
    end
  end

  def games
    self.wins + self.losses
  end
end
