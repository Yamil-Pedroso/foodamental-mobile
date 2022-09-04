Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :lists, only: [:index, :show]
  resources :plannings
  resources :products
  resources :recipes
end
