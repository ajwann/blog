Rails.application.routes.draw do
  devise_for :admins
  get 'admin/home'
  get 'landing/index'

  resources :posts

  root 'posts#index'
end
