Rails.application.routes.draw do
  devise_for :users
  
  root to: "arrows#index"
  
  resources :arrows, except: [:new, :edit, :update, :destroy]
end
