# == Schema Information
#
# Table name: headlines
#
#  id        :integer          not null, primary key
#  name      :string
#  picture   :string
#  body      :string
#  league_id :integer
#

class HeadlinesController < ApplicationController

  def index
    @league = League.find(params[:league_id])
    @headlines = Headline.all
    @year = Year.last
    @scores = Score.where("hometeam_league_id = ? AND awayteam_league_id = ?", @league.id, @league.id)
      filtered_statistics = []
    @teams = Team.where('league_id = ?', @league.id)
      @teams.each do |team|
        filtered_statistics << team.statistics
      end
        statistics = filtered_statistics.flatten
    @statistics = Statistic.where(id: statistics.map(&:id)).where("year_id = ?", @year.id)
    @g_statistics = Statistic.where(id: statistics.map(&:id)).where("year_id = ?", @year.id)
    @standing_teams = @league.teams
  end

  def show
    @headline = Headline.find(params[:headline_id])
    @league = League.find(params[:league_id])
  end
end
