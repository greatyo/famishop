Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :familys do
    resources :items, only:[:new, :create, :edit, :update, :destroy]
  end
end
