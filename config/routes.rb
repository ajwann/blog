Rails.application.routes.draw do
  devise_for :admins
  get '/.well-known/acme-challenge/xrXJjczoBkcC6IdjRfHaauucSXBFj9zji_JkTe5PRN4' => 'ssl_certificates#letsencrypt'
  get 'admin/home'
  get 'feed' => 'posts#feed', defaults: { format: :atom }

  resources :posts

  root 'landing#about'
end
