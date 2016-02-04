class VideosController < ApplicationController
  def show
    @league = League.find(params[:league_id])
    @videos = Video.all
    @video = Video.find(params[:id])
  end

  def new
    @videos = Video.all
    @league = League.find(params[:league_id])
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      redirect_to league_video_path(@video.league_id,@video.id)
    else
      render 'new'
    end
  end

private
  def video_params
    params.require(:video).permit(:title,:caption,:short_url,:url,:league_id)
  end

end
