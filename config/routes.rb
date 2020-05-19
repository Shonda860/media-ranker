Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homepages#index"
  resources :works
  resources :users, only: [:index, :show]


  get "/login", to: "users#login_form", as:"login"
  post "/login", to: "users#login"
end
