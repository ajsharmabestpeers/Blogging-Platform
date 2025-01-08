Rails.application.routes.draw do
  devise_for :users
  
    # get 'posts/new', to: 'posts#new', as: 'new_post'
    # get 'posts/:id/edit', to: 'posts#edit', as: 'edit_post'
    # delete 'posts/:id', to: 'posts#destroy'

    # resources :posts  
    resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  root to: "home#index" 
  # Defines the root path route ("/")
  # root "posts#index"
end
