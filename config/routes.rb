Rails.application.routes.draw do
  devise_for :users
  
  root to: "landing#index"
  
  resources :arrows, except: [:new, :create, :edit, :update, :destroy]
end
