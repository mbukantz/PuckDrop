# == Schema Information
#
# Table name: salaries
#
#  id         :integer          not null, primary key
#  year_0     :integer
#  year_1     :integer
#  year_2     :integer
#  year_3     :integer
#  year_4     :integer
#  year_5     :integer
#  year_6     :integer
#  year_7     :integer
#  year_8     :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SalariesController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    @player = Player.new
    @players = Player.where("team_id = ?", @team.id)
    @salary = Salary.new
    @teams = Team.all
    @forwards = @team.salaries.where("position = ? OR position = ? OR position = ?","Center","Right Wing","Left Wing")
    @defense = @team.salaries.where("position = ?", "Defense")
    @goalies = @team.salaries.where("position = ?", "Goalie")
    @salaries = @team.salaries
  end

  def new
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    @players = Player.where("team_id = ?", @team.id)
    @salary = Salary.new
  end

  def create
    @league = League.find params[:league_id]
    @team = Team.find(params[:team_id])
    @salary = Salary.new(salary_params)
    if @salary.save
      redirect_to league_team_salaries_path(@league,@team)
    else
      render 'new'
    end
  end

  private

  def salary_params
    params.require(:salary).permit(:player_id,:year_0, :year_1, :year_2, :year_3, :year_4, :year_5, :year_6, :year_7)
  end
end
