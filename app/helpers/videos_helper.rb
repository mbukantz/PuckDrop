module VideosHelper
  def youtube_video(url)
    render :partial => 'video', :locals => { :url => url }
  end
end
