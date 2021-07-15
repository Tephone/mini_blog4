Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  resources :users, only: %i[index show]
  root 'blogs#index'
  resources :blogs, only: %i[index new create]
	resources :relationships, only: %i[create destroy]
	resources :comments, only: %i[create destroy]
end
