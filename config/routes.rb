Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :posts, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  namespace :admin do
    resources :users, only:[:index]
  end
end
