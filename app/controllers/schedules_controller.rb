class SchedulesController < ApplicationController

  def new
    @league = League.find(params[:league_id])
    @schedule = Schedule.new
    @schedules = Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", @league.id, @league.id, @league.id)
  end

  def create
    @league = League.find params[:league_id]
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to league_schedules_path(@league)
    else
      render 'new'
    end
  end

  def edit
    @league = League.find params[:league_id]
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to league_schedules_path
    else
      @league = League.find(params[:league_id])
      render 'edit'
    end
  end

  def index
    @league = League.find(params[:league_id])
    @schedule = Schedule.new
    @schedules = Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", @league.id, @league.id, @league.id)
  end

  def team_schedule
    @league = League.find(params[:league_id])
    @team = Team.find(params[:team_id])
    @schedules = Schedule.where("league_id = ? AND hometeam_league_id = ? AND awayteam_league_id = ?", @league.id, @league.id, @league.id).where("hometeam = ? OR awayteam = ?", params[:team_id], params[:team_id])
  end

  def schedule_params
    params.require(:schedule).permit(:date, :hometeam, :awayteam, :homegoals, :awaygoals, :league_id, :hometeam_league_id, :awayteam_league_id)
  end

end
