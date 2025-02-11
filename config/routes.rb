Rails.application.routes.draw do
  devise_for :users
  
    # get 'posts/new', to: 'posts#new', as: 'new_post'
    # get 'posts/:id/edit', to: 'posts#edit', as: 'edit_post'
    # delete 'posts/:id', to: 'posts#destroy'

    # resources :posts  
   resources :profiles, only: [:new, :create, :show, :edit, :update]

    # resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]

    # resources :comments
    resources :posts do
      resources :comments, only: [:create, :destroy ,:show , :edit, :update , :upload]
    end
    
    resources :categories, only: [:index, :show, :new, :create ,:destroy ,:edit ,:update] do
      resources :posts, only: [:index]
    end
  get 'home/index'
  get 'my_posts', to: 'posts#my_posts', as: 'my_posts'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  root to: "home#index" 
  # Defines the root path route ("/")
  # root "posts#index"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
