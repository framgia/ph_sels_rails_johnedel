Rails.application.routes.draw do
  
  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
  namespace :admin do
    resources :categories do
      resources :words 
    end
  end

  resources :lessons do
    resources :answers
  end

  resources :categories, only: [:index]
  resources :words, only: [:index]
end