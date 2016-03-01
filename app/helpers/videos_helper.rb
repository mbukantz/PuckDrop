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

module VideosHelper
  def youtube_video(url)
    render :partial => 'video', :locals => { :url => url }
  end
end
