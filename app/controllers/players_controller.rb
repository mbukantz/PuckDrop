# == Schema Information
#
# Table name: players
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  birthday   :datetime
#  height     :string
#  weight     :string
#  shoots     :string
#  position   :string
#  city       :string
#  state      :string
#  country    :string
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PlayersController < ApplicationController
  def index
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @league = League.find params[:league_id]
    @team = Team.find params[:team_id]
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to league_team_players_path
    else
      render 'new'
    end
  end

  def edit
    @league = League.find params[:league_id]
    @team = Team.find params[:team_id]
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to league_team_players_path
    else
      render 'edit'
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to league_team_players_path
  end

  private
    def set_player
      @player = Player.find(params[:id])
    end

    def player_params
      params.require(:player).permit(:first_name,:last_name,:birthday,:height,:weight,:shoots,:position,:city,:state,:country,:team_id)
    end
end
