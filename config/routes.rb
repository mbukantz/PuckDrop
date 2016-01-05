Rails.application.routes.draw do
  resources :leagues do
    resources :standings
    resources :teams do
      resources :players
      resources :statistics
    end
  end
  get '/leagues/:id/leaders', to: 'statistics#leaders', as: 'leaders'
  root to: "home#index"
  get '/leagues/:league_id/teams/:team_id/statistics/years/:id', to: 'years#yearly_stats', as: 'yearly'
end
