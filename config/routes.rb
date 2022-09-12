Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events, only: [:index, :show] do
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
