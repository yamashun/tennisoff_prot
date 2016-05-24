Rails.application.routes.draw do
  root 'off_meetings#index'
  devise_for :users
  resources :off_meetings do
    resources :entries, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit]
end
