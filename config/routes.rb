Rails.application.routes.draw do
  devise_for :users
  root 'blogs#index'
  resources :blogs, only: %i[index new create]
end