# == Route Map
#

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  get '/login', to: 'user_sessions#new'
  post '/login', to: 'user_sessions#create'
  delete '/logout', to: 'user_sessions#destroy'
  get '/signup', to: "users#new"

  resources :users, only: %i[index show create]
  resources :posts, shallow: true do
    resources :comments
  end
  resources :likes, only: %i[create destroy]
end
