Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :teams, controller: "users/teams"
    resources :sports
  end

  root 'users#index'
end
