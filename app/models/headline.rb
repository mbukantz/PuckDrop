# == Schema Information
#
# Table name: headlines
#
#  id        :integer          not null, primary key
#  name      :string
#  picture   :string
#  body      :string
#  league_id :integer
#

class Headline < ActiveRecord::Base
  belongs_to :league
end
