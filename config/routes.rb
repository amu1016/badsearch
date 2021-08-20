Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "clubs#index"
  resources :clubs
  resources :users, only: [:show, :edit]
  resources :rooms, only: [:index, :new, :create, :show] do
    resources :messages, only: [:index, :create]
  end
end


