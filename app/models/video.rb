# == Schema Information
#
# Table name: videos
#
#  id         :integer          not null, primary key
#  title      :string
#  caption    :string
#  url        :string
#  short_url  :string
#  league_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Video < ActiveRecord::Base
  belongs_to :league

  def image_url
    "http://img.youtube.com/vi/#{self.short_url[17..-1]}/default.jpg"
  end
end
