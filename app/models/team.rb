# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  city       :string
#  name       :string
#  coach      :string
#  arena      :string
#  league_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Team < ActiveRecord::Base
  validates :name, presence: true
  has_many :players
  has_many :salaries, through: :players
  has_many :statistics, through: :players
  belongs_to :league
  has_one :standing

  def full_name
    "#{self.city} #{self.name}"
  end
end
