Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resource :profile, only: [:show], controller: "users/profile"
    resources :teams, controller: "users/teams"
    resources :sports, controller: "users/sports"
  end

  root 'users#index'
end
