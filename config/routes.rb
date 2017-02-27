Rails.application.routes.draw do
  resources :users do
    resource :profile, only: [:show], controller: "users/profile"
    resources :teams, controller: "users/teams"
    resources :sports, controller: "users/sports"
  end

  resources :organizations, only: [:index, :show] do
    resources :teams, only: :index, controller: "organizations/teams"
  end

  root 'users#index'
end
