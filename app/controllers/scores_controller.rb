class ScoresController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @scores = Score.where("hometeam_league_id = ? AND awayteam_league_id = ?", @league.id, @league.id)
  end
end
