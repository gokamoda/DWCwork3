Rails.application.routes.draw do
  devise_for :users
  get "/home/about"=>"homes#about"
  root to: "homes#top"
  resources :books, only: [:new, :index,:create, :show, :edit, :destroy,:update]
  resources :users, only: [:index, :show,:create, :edit,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
