Rails.application.routes.draw do
  devise_for :users
  devise_for :users, skip: :all
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get 'shopping_list/:recipe_id', to: 'recipes#shopping_list'
  get 'recipe_foods/:recipe_id', to: 'recipe_foods#new'
  post 'recipe_foods/:recipe_id', to: 'recipe_foods#create'
  resources :recipe_foods, only: [:destroy, :update, :edit]


  # Defines the routes for the Users controller
  
root "public_recipes#index"
  resources :users, only: [:index]
  resource :public_recipes, only: [:index, :show]
  resources :recipes, only: [:index, :show, :create, :new, :destroy, :update] do
    resources :recipe_foods, only: [:new, :create]
  end
  resources :foods, except: [:update]
  resource :shopping_lists, only: [:index]
end
