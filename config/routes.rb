Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  # Mount Rswag API and UI engines
  mount Rswag::Api::Engine => '/api-docs'
  mount Rswag::Ui::Engine => '/api-docs'

  # Use Doorkeeper for OAuth
  use_doorkeeper

  # Devise for user authentication
  devise_for :users

  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # API version 1 namespace
  namespace :api do
    namespace :v1 do
      resources :leagues
      resources :teams
      resources :players
      resources :matches
    end
  end

  post "/graphql", to: "graphql#execute"

  # Defines the root path route ("/")
  # root "posts#index"
  # root 'api/v1/leagues#index'
  # root 'welcome#index'

  # config/routes.rb
  # root 'api/v1/leagues#status'  # Or any relevant endpoint for your API



end
