Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :lists
  resources :plannings
  resources :products
  resources :recipes
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end
end
