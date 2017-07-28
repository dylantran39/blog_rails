Rails.application.routes.draw do
  root "static_pages#home"
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts, only: [:create, :show]
  resources :comments
end
