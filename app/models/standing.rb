class Standing < ActiveRecord::Base
  belongs_to :team

  def win_percentage
    (self.wins/ (self.wins + self.losses).to_f).round(3)
  end
end
