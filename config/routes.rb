Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homepages#index"
  resources :works
  resources :users

  post "/works" , to: "works#by_category", as: "by_category"
end
