# == Schema Information
#
# Table name: standings
#
#  id         :integer          not null, primary key
#  games      :integer
#  wins       :integer
#  losses     :integer
#  team_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StandingsController < ApplicationController

  def index
    @league = League.find(params[:league_id])
    @teams = @league.teams
  end
end
