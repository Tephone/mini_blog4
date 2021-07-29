Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: %i[index show]
  root 'blogs#index'
  resources :blogs
  resources :relationships, only: %i[create destroy]
  resources :comments, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
end
