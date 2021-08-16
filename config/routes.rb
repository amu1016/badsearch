Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "clubs#index"
  resources :clubs, only: [:index, :new, :create, :show]
  resources :users, only: [:show, :edit]
end
