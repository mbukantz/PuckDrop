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
end
