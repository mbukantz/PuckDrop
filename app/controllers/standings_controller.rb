# == Schema Information
#
# Table name: standings
#
#  id         :integer          not null, primary key
#  games      :integer
#  wins       :integer
#  losses     :integer
#  team_id    :integer
#  year_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StandingsController < ApplicationController

  def index
    @league = League.find(params[:league_id])
    @team = Team.new
    @teams = @league.teams
    @standing = @team.standing
  end

  def edit
    @league = League.find params[:league_id]
    @standing = Standing.find(params[:id])
  end

  def update
    @standing = Standing.find(params[:id])
    if @standing.update(standing_params)
      redirect_to league_standings_path
    else
      @league = League.find(params[:league_id])
      render 'edit'
    end
  end

  private

  def standing_params
    params.require(:standing).permit(:games,:wins,:losses,:win_percentage,:year_id)
  end
end
