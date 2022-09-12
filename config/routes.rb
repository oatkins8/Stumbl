Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :events, only: [:index, :show] do
    resources :bookings, only: [:create]
  end
  resources :venues, except: [:index] do
    resources :events, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :users, only: [:show]
end


#root to: "events#index"