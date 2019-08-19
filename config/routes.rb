Rails.application.routes.draw do
  get 'categories/index'
  root 'static_pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/signup', to:'users#new'
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :sessions
  namespace :admin do 
    get '/home', to:'users#home'
    resources :users
    resources :categories do
      resources :words
    end
  end
end
