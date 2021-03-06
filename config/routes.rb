Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resources :documents, only: [:index, :show]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'

  root 'static_pages#index'
end
