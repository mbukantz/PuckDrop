# == Schema Information
#
# Table name: leagues
#
#  id           :integer          not null, primary key
#  name         :string
#  commissioner :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class LeaguesController < ApplicationController
  def index
    @leagues = League.all
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    if @league.save
      redirect_to leagues_path
    else
      render 'new'
    end
  end

  def show
    @league = League.find(params[:id])
  end

  private
    def league_params
      params.require(:league).permit(:name,:commissioner)
    end
end
