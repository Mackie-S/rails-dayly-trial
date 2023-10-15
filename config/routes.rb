Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    resources :comments, only: [:new, :create]
    resource :like, only: [:create, :destroy]
  end
  resource :profile, only: [:show, :edit, :update]
  resources :favorites, only: [:index]
end
