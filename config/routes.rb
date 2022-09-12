Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events, only: [:index, :show] do
    resources :bookings, only: [:create] do
      resources :payments, only: :new
    end
    member do
      post 'toggle_favorite', to: "events#toggle_favorite"
    end
    resources :bookings, only: [:create]

  end
  resources :venues, except: [:index] do
    resources :events, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :users, only: [:show]
end
