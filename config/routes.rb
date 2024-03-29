Rails.application.routes.draw do
  namespace :devise do
    devise_for :users
  end

  get "/about_me", to: "static_sites#about_me"
  root "users#index"
  resources :articles do
    resources :comments, only: [:create]
    post 'change_status', on: :member
  end
  resources :shops do
    resources :shop_products, only: %i(update edit)
    resources :baskets, only: [:show, :create, :update] do
      resources :adresses, only: [:create]
    end
  end
  resources :users
  resources :songs
  resources :albums, except: [:delete]
  resources :artists
  resources :fitnesses
  resources :activity, only: [:index]
  resources :categories do
    resources :products do
      post "bulk_update", on: :member
    end
  end

  resources :uploads, except: [:delete, :edit, :update] do
    post "process_file", on: :member
    resources :measurements, only: [:index, :show]
  end
  # /articles/:id/change_status
  # post "/articles/:id/change_status" => "articles#change_status", :as => :articles_change_status
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
