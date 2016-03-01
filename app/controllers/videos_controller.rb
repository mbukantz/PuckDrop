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

class VideosController < ApplicationController
  def show
    @league = League.find(params[:league_id])
    @videos = Video.all
    @video = Video.find(params[:id])
    @video_new = Video.new
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
