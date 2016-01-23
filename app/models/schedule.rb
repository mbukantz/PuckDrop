# == Schema Information
#
# Table name: schedules
#
#  id         :integer          not null, primary key
#  hometeam   :string
#  awayteam   :string
#  date       :datetime
#  homegoals  :string
#  awaygoals  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Schedule < ActiveRecord::Base
  belongs_to :league
  belongs_to :standing

  def home_team
    Team.find(self.hometeam).full_name
  end

  def home_team_id
    Team.find(self.hometeam).id
  end

  def away_team
    Team.find(self.awayteam).full_name
  end

  def away_team_id
    Team.find(self.awayteam).id
  end

  def short_date
    self.date.strftime("%B %-d, %Y")
  end

end
