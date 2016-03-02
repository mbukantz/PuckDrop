Rails.application.routes.draw do
  resources :leagues do
    resources :headlines, except: [:index, :show]
    resources :scores
    resources :standings
    resources :videos
    resources :schedules, except: :show
    resources :teams do
      resources :players
      resources :statistics
      resources :salaries, except: :show
    end
  end
  root to: "home#index"
  get '/leagues/:league_id/statistics/years/:year_id/leaders', to: 'statistics#leaders', as: 'leaders'
  get '/leagues/:league_id/teams/:team_id/statistics/years/:id', to: 'years#yearly_stats', as: 'yearly'
  get '/leagues/:league_id/schedules/:team_id/', to: 'schedules#team_schedule', as: 'team_schedule'
  get '/leagues/:league_id/home', to: 'headlines#index', as: 'headlines'
  get '/leagues/:league_id/news/:headline_id', to: 'headlines#show', as: 'headline'
  get '/leagues/:league_id/teams/:team_id/salaries/:salary_id/buyout', to: 'salaries#buyout', as: 'buyout'
  get '/leagues/:league_id/teams/:team_id/salaries/buyoutcalc', to: 'salaries#buyout_home', as: 'buyout_home'

end
