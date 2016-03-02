# == Schema Information
#
# Table name: salaries
#
#  id         :integer          not null, primary key
#  year_0     :integer
#  year_1     :integer
#  year_2     :integer
#  year_3     :integer
#  year_4     :integer
#  year_5     :integer
#  year_6     :integer
#  year_7     :integer
#  year_8     :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Salary < ActiveRecord::Base
  belongs_to :player

  def value
    self.year_0.to_i + self.year_1.to_i  + self.year_2.to_i  + self.year_3.to_i  + self.year_4.to_i  + self.year_5.to_i  + self.year_6.to_i  + self.year_7.to_i  + self.year_8.to_i
  end

  def years
    years = 0
    [self.year_0,self.year_1,self.year_2,self.year_3,self.year_4,self.year_5,self.year_6,self.year_7,self.year_8].each do |year|
      if year
        years += 1
      end
    end
    years
  end

  def aav
    self.value/self.years
  end

  def buyout_value
    if self.player.age > 26
      self.value * 2 / 3
    else
      self.value * 1 / 3
    end
  end

  def payout_length
    self.years * 2
  end

  def annual_payout
    self.buyout_value/ self.payout_length
  end

end
