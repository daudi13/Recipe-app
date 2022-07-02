class PublicRecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @public_recipe = []
    public_recipes = Recipe.includes(%i[foods recipe_foods user]).where(public: true).order('created_at DESC')
    public_recipes.each do |recipe|
      public_recipe = {}
      public_recipe[:recipe] = recipe
      public_recipe[:foods_quantity] = recipe.foods.length
      public_recipe[:price_total] = recipe.recipe_foods.reduce(0) do |price_total, recipe_food|
        price_total + (recipe_food.food.unit_price * recipe_food.quantity)
      end
      @public_recipe << public_recipe
    end
  end
end
