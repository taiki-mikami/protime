Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'toppages#index'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
end
