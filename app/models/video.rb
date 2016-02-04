class Video < ActiveRecord::Base
  belongs_to :league

  def image_url
    "http://img.youtube.com/vi/#{self.short_url[17..-1]}/default.jpg"
  end
end
