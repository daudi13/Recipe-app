Rails.application.routes.draw do
  devise_for :users
  devise_for :users, skip: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "public_recipes#index" 

  resources :foods, only: [:index, :show]
  resources :recipes, only: [:index, :show, :create, :new, :destroy, :update] do
    resources :recipes_foods, only: [:new, :create]
  end
  resources :public_recipes, only: [:index, :show]
  resources :shopping_lists, only: []
end
