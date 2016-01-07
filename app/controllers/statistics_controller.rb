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

  def new
    @league = League.find params[:league_id]
    @team = Team.find params[:team_id]
    @statistic = Statistic.new
    @players = Player.where("team_id = ?", @team.id)
    @years = Year.all
  end

  def create
    @league = League.find params[:league_id]
    @team = Team.find params[:team_id]
    @statistic = Statistic.new(statistic_params)
    if @statistic.save
      redirect_to yearly_path(@league.id, @team.id,  @statistic.year.id)
    else
      render 'new'
    end
  end
  def edit
    @league = League.find params[:league_id]
    @team = Team.find params[:team_id]
    @players = @team.players
    @statistic = Statistic.find(params[:id])
  end

  def update
    @league = League.find params[:league_id]
    @team = Team.find params[:team_id]
    @statistic = Statistic.find(params[:id])
    if @statistic.update(statistic_params)
      redirect_to yearly_path(@league.id, @team.id,  @statistic.year.id)
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
    params.require(:statistic).permit(:games,:goals,:assists,:points,:plus_minus,:atoi, :pims,:player_id,:year_id)
  end

end
