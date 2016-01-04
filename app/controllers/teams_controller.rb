# == Schema Information
#
# Table name: teams
#
#  id         :integer          not null, primary key
#  city       :string
#  name       :string
#  coach      :string
#  arena      :string
#  league_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TeamsController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @teams = Team.all
  end

  def new
    @league = League.find params[:league_id]
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to league_teams_path
    else
      render 'new'
    end
  end

  def edit
    @league = League.find params[:league_id]
    @team = Team.find(params[:id])
  end

respond_to :html, :json
  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      redirect_to league_teams_path
    else
      render 'edit'
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to league_teams_path
    # notice: 'Team was successfully destroyed.'
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

    def team_params
      params.require(:team).permit(:city, :name, :coach, :arena, :league_id)
    end
end
