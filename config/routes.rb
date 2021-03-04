Rails.application.routes.draw do
  devise_for :users

   resources :users,only: [:show,:index,:edit,:update, :update]
   resources :books, only: [:edit, :update, :create, :index, :show, :destroy] do
     resources :book_comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
  end
  root 'homes#top'
  get 'home/about' => 'homes#about'
end
