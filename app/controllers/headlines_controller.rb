class HeadlinesController < ApplicationController

  def index
    @league = League.find(params[:league_id])
    @headlines = Headline.all
  end

  def show
    @headline = Headline.find(params[:headline_id])
    @league = League.find(params[:league_id])
  end
end
