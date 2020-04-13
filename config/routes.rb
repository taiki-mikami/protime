Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'toppages#index'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get 'users', to: 'users#new'
  get 'study_records', to: 'study_records#new'
  get 'ranking', to: 'ranking#index'
  
  resources :users, only: [:show, :new, :create, :destroy] do
    member do
      get :followings
      get :followers
      get :goodlists
      get :following_studies
      get :follower_studies
    end
  end
  
  resources :study_records, only: [:show, :new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
