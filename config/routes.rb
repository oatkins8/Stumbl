Rails.application.routes.draw do
  devise_for :users
  root to: "event#index"
  resources :event, only: [:index, :show]
  resources :venue, except: [:index] do
    resources :event, only: [:new, :create, :edit, :update, :destroy]
  end
end
