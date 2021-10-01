Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root to: "clubs#index"
  post 'set_cities', to: 'cities#set_cities'
  
  resources :clubs do
    resource :likes, only: [:create, :destroy]
    resources :events
    resources :wants
    collection do
      get 'search'
    end
  end
  

  resources :users, only: [:show, :edit]
  resources :rooms, only: [:index, :new, :create, :show] do
    resources :messages, only: [:index, :create]
  end
end


