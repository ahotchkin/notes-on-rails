Rails.application.routes.draw do

  root "sessions#home"

  get "/signup", to: "users#new"

  # use this for incorrect signup
  post "/signup", to: "users#create"

  resources :notes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
