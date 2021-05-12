Rails.application.routes.draw do
  root to: "homes#top"
  devise_for :users
  resources :posts, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  # 退会確認画面
  get '/users/:id/unsubscribe' => 'users#unsubscribe', as: 'unsubscribe'
  # 論理削除用のルーティング
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  namespace :admin do
    resources :users, only:[:index, :edit, :update]
    resources :posts, only:[:index]
  end
end
