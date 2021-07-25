Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  post "answer", to: "homes#answer"
  get "about", to: "homes#about"
  get "save", to: "homes#save"
  get "investment", to: "homes#investment"
  get "trust", to: "homes#trust"
  get "stock", to: "homes#stock"
  get "asset", to: "homes#asset"
  get "nisa", to: "homes#nisa"
  get "deposit", to: "homes#deposit"

  get "search", to: "search#search"

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "followings", to: "relationships#followings", as: "followings"
    get "followers", to: "relationships#followers", as: "followers"
    get "posts/:id/liles", to: "users#likes", as: "likes"
  end

  resources :posts, only: [:new, :index, :show, :create, :edit, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
  end
end
