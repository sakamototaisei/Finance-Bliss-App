Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get "answer", to: "homes#answer"
  get "about", to: "homes#about"
  get "save", to: "homes#save"
  get "investment", to: "homes#investment"
  get "time", to: "homes#time"
  get "margin", to: "homes#margin"
  get "cut", to: "homes#cut"
  get "results", to: "homes#results"
  get "regular", to: "homes#regular"
  get "trust", to: "homes#trust"
  get "stock", to: "homes#stock"
  get "asset", to: "homes#asset"
  get "nisa", to: "homes#nisa"
  get "deposit", to: "homes#deposit"

  get "search", to: "search#search"

  resources :users, omly: [:indes, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "followings", to: "relationships#followings", as: "followings"
    get "follwers", to: "relationships#follwers", as: "follwers"
    get "posts/:id/liles", to: "users#likes"
  end

  resources :post, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :liles, only: [:create, :destroy]
  end


end
