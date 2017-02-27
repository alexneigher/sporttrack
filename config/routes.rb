Rails.application.routes.draw do
  resources :users do
    resource :profile, only: [:show], controller: "users/profile"
    resources :teams, controller: "users/teams"
    resources :sports, controller: "users/sports"
  end

  resources :teams, except: [:index, :show, :create, :new, :edit, :destroy, :update] do
    resources :invitations, controller: 'teams/invitations'
  end

  get 'invitations/:authentication_token', to: 'teams/invitations#redeem'

  resources :organizations, only: [:index, :show] do
    resources :teams, only: :index, controller: "organizations/teams"
  end

  root 'users#index'
end
