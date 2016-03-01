# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  birthday   :datetime
#  height     :string
#  weight     :string
#  shoots     :string
#  position   :string
#  city       :string
#  state      :string
#  country    :string
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Player < ActiveRecord::Base
  belongs_to :team
  has_many :statistics
  has_one :salary, :foreign_key => :player_id
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birthday, presence: true

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def hometown
    "#{self.city}, #{self.state}"
  end

  def birthdate
    self.birthday.strftime("%B %-d, %Y")
  end

  def age
    now = Date.current
    dob = self.birthday
    age = now.year - dob.year
    age -= 1 if now.yday < dob.yday
    age
  end

  def hgt
    inches = self.height.to_i
    feet = inches / 12
    remainder = inches % 12
    height = "#{feet}'#{remainder}"
  end

  def full_position
    if self.position == "Right Wing" || self.position == "Left Wing" || self.position == "Center"
      "Forward"
    else
      self.position
    end
  end
end
