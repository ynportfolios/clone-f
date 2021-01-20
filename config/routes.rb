Rails.application.routes.draw do
  resources :pictures do
    collection do
      post :confirm
    end
  end
  root to: 'tops#index'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update, :show]

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development? || Rails.env.production?
end
