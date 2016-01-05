# == Schema Information
#
# Table name: statistics
#
#  id         :integer          not null, primary key
#  games      :integer
#  goals      :integer
#  assists    :integer
#  points     :integer
#  plus_minus :integer
#  atoi       :float
#  pims       :integer
#  wins       :integer
#  losses     :integer
#  gaa        :float
#  saves      :integer
#  shots      :integer
#  shutouts   :integer
#  player_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StatisticsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    @players = @team.players
  end

  def edit
    @league = League.find params[:league_id]
    @team = Team.find params[:team_id]
    @statistic = Statistic.find(params[:id])
  end

  def update
    @statistic = Statistic.find(params[:id])
    if @statistic.update(statistic_params)
      redirect_to league_team_statistics_path
    else
      render 'edit'
    end
  end

  def leaders
    @statistics = Statistic.order(sort_column + " " + sort_direction).paginate(:per_page => 20, :page => params[:page])
    @league = League.find(params[:id])
  end

  private

  def sort_column
    Statistic.column_names.include?(params[:sort]) ? params[:sort] : "Goals"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

  def statistic_params
    params.require(:statistic).permit(:games,:goals,:assists,:points,:plus_minus,:atoi)
  end

end
