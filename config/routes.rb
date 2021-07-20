Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  mount LetterOpenerWeb::Engine, at: 'inbox' if Rails.env.development?
  resources :users, only: %i[index show]
  root 'blogs#index'
  resources :blogs, only: %i[index new create show]
  resources :relationships, only: %i[create destroy]
  resources :comments, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
end
