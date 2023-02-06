Rails.application.routes.draw do
  resources :scientists
  resources :planets, only: [:index]
  resources :missions, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
