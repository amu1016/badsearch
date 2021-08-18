Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "clubs#index"
  resources :clubs
  resources :users, only: [:show, :edit]
  resources :rooms, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create]
  end
end
