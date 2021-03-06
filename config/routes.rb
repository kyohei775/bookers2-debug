Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'
  
  resources :books, only: [:edit, :update, :create, :index, :show, :destroy] do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
 
  end
  
  resources :users,only: [:show,:index,:edit,:update,:create] do
  	member do
     get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
end
