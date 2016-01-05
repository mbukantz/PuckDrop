class YearsController < ApplicationController

  def yearly_stats
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    @year = Year.find(params[:id])
    @statistics = @team.statistics.where("year_id = ?", @year.id)
    @years = Year.all
  end

end
