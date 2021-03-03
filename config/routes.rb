Rails.application.routes.draw do
  devise_for :users

  resources :users,only: [:show,:index,:edit,:update, :update]
  resources :books, only: [:edit, :update, :create, :index, :show, :destroy]
  root 'homes#top'
  get 'home/about' => 'homes#about'
end
