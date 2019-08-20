Rails.application.routes.draw do
  root 'static_pages#home'

  get 'categories/index'
  get '/signup', to:'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :sessions
  resources :lessons, only: [:create, :show] do
    resources :answers, only: [:new, :create]
  end

  namespace :admin do 
    get '/home', to:'users#home'
    resources :users
    resources :categories do
      resources :words
    end
  end
end
