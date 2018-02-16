Rails.application.routes.draw do
  resources :users
  resources :profiles
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
