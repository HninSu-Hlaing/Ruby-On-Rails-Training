Rails.application.routes.draw do
  get "sign_up", to: "users#new"
  post "sign_up", to: "users#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "tuto9", to: "store#store_img"
  post "tuto9", to: "store#create"
  get "tuto11" , to: "pages#qr_code_generator"

  controller :pages do
    get :qr_code_generator
    get :qr_code_download
    get :qr_show
  end
  #resources :users, except: [:new]
  root to: "main#index"
end
