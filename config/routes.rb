Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}
  root to: "items#index"
  resources :familys, only:[:new, :create] do
    resources :items, only:[:new, :create, :edit, :update, :destroy] do
      collection do
        get 'index_request'
        put 'update_request'
        get 'index_destroy'
      end
    end
  end
end
