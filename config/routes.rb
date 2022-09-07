Rails.application.routes.draw do
  devise_for :users
  root to: "events#index"
  resources :events, only: [:index, :show] do
    resources :bookings, only: [:create]
  end
  resources :venues, except: [:index] do
    resources :events, only: [:new, :create, :edit, :update, :destroy]
  end
end
