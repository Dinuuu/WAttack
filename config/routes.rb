WAttack::Application.routes.draw do

  resources :projects do
  	resources :tests do
      member do
        get :run
      end
      resources :results, only: [:index, :show]
  	end
  end
  devise_for :users
  root to: 'projects#index'

  require 'sidekiq/web'
  mount Sidekiq::Web, at: 'sidekiq'
  mount PgHero::Engine, at: 'pghero'
end
