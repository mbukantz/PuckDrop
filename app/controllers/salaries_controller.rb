class SalariesController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    @teams = Team.all
    @forwards = @team.salaries.where("position = ? OR position = ? OR position = ?","Center","Right Wing","Left Wing")
    @defense = @team.salaries.where("position = ?", "Defense")
    @goalies = @team.salaries.where("position = ?", "Goalie")
    @salaries = @team.salaries
  end
end
