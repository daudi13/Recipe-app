Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "public_recipes#index" 

  resource :public_recipes, only: [:index, :show]
  resource :recipes, only: []
  resource :foods, only: []
  resource :recipes_details, onlys: []
  resource :shopping_lists, only: []
end
