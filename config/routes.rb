Rails.application.routes.draw do
  resources :blogs, only: %i[index new create]
end