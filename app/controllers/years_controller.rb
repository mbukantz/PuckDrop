# == Schema Information
#
# Table name: years
#
#  id         :integer          not null, primary key
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class YearsController < ApplicationController

  def yearly_stats
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    @year = Year.find(params[:id])
    @statistics = @team.statistics.where("year_id = ?", @year.id).order(sort_column + " " + sort_direction)
    @years = Year.all
    @statistic = Statistic.new
    @players = Player.where("team_id = ?", @team.id)
    @player = Player.new
  end

  private
  def sort_column
    Statistic.column_names.include?(params[:sort]) ? params[:sort] : "Goals"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end

end
