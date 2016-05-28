Rails.application.routes.draw do
  root 'off_meetings#index'
  devise_for :users
  ##off_meetings/のルーティングより上に書く必要あり
  get 'off_meetings/search' => 'off_meetings#search'
  resources :off_meetings do
    resources :entries, only: [:create, :destroy]
    resources :questions, only: [:create, :update]
  end
  resources :users, only: [:show, :edit, :update]

end
