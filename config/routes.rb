Rails.application.routes.draw do
  devise_for :users
  devise_for :users, skip: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'shopping_lists', to: 'shopping_lists#index'

  devise_scope :user do
    authenticated :user do
      root :to => "foods#index" , as: :authenticated_root
    end
    unauthenticated :user do
      root :to => "public_recipes#index", as: :unauthenticated_root
    end
  end

  # Defines the routes for the Users controller
  
root "public_recipes#index"
  resources :users, only: [:index]
  resource :public_recipes, only: [:index, :show]
  resource :recipes, only: [:index, :show]
  resources :foods, except: [:update]
  resource :recipes_details, onlys: []
  resource :shopping_lists, only: [:index]
end
