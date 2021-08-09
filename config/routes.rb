Rails.application.routes.draw do

root to: "clubs#index"
resources :club, only: [:index]


end
