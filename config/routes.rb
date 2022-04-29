Rails.application.routes.draw do
  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "tuto9", to: "store#store_img"
  post "tuto9", to: "store#create"
  #resources :users, except: [:new]
  root to: "main#index"
end
