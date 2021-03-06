Rails.application.routes.draw do
  root 'off_meetings#index'
  devise_for :users
  ##off_meetings/のルーティングより上に書く必要あり
  get 'off_meetings/search' => 'off_meetings#search'
  get 'off_meetings/get_areas' => 'off_meetings#get_area'
  get 'off_meetings/map/:id' => 'off_meetings#show_map'

  get 'users/:id/edit_password/' => 'users#edit_password'
  patch 'users/:id/update_password/' => 'users#update_password'

  resources :off_meetings do
    resources :entries, only: [:create, :destroy]
    resources :questions, only: [:create, :update] do
      resources :answers, only: [:create]
    end
  end
  resources :users, only: [:show, :edit, :update]
  resources :relationships, only: [:create, :destroy]

end
