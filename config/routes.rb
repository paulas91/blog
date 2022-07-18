Rails.application.routes.draw do
  
  root "articles#index"
  resources :articles do
    resources :comments, only: [:create]
  end
  resources :shops
  resources :users
  resources :songs
  resources :albums, except: [:show, :delete]
  resources :artists
  resources :uploads, except: [:delete, :edit, :update]
  # /articles/:id/change_status
  post "/articles/:id/change_status" => "articles#change_status", :as => :articles_change_status
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
