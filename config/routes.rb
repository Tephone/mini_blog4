Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index show]
  root 'blogs#index'
  resources :blogs, only: %i[index new create]
end