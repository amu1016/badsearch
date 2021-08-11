Rails.application.routes.draw do

  devise_for :users
  root to: "clubs#index"
  resources :clubs, only: [:index]
  resources :users, only: [:show]
end
