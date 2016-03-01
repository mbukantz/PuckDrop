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

require 'rails_helper'

RSpec.describe Salary, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
