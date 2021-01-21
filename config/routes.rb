Rails.application.routes.draw do
  resources :pictures do
    collection do
      post :confirm
    end
  end
  root to: 'tops#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :show]
  resources :favorites, only: [:create, :destroy, :show]
end
