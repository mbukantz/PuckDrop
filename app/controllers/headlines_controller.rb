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

class HeadlinesController < ApplicationController

  def index
    @league = League.find(params[:league_id])
    @headlines = Headline.all
    @scores = Score.where("hometeam_league_id = ? AND awayteam_league_id = ?", @league.id, @league.id)
  end

  def show
    @headline = Headline.find(params[:headline_id])
    @league = League.find(params[:league_id])
  end
end
