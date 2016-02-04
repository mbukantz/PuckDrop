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
    @headline = Headline.new
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
    @schedules = Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", @league.id, @league.id, @league.id).where("date > ?",Time.now)
  end

  def show
    @headline = Headline.find(params[:headline_id])
    @league = League.find(params[:league_id])
  end

  def new
    @headlines = Headline.all
    @league = League.find(params[:league_id])
    @headline = Headline.new
  end

  def create
    @headline = Headline.new(headline_params)
    if @headline.save
      redirect_to headlines_path(@headline.league_id,@headline.id)
    else
      render 'new'
    end
  end

private
  def headline_params
    params.require(:headline).permit(:name,:body,:picture,:league_id)
  end
end
