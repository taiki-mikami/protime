Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'toppages#index'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :goodlists
    end
  end
  
  resources :study_records, only: [:new, :create, :destroy]
end
