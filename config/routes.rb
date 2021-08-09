Rails.application.routes.draw do

  devise_for :users
  root to: "clubs#index"
  resources :club, only: [:index]
end
