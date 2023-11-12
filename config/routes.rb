Rails.application.routes.draw do
  devise_for :users
  root to: "shoppings#index"
  resources :items, only:[:new, :create, :edit, :update, :destroy]
end
