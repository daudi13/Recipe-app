class PublicRecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @recipes = Recipe.includes(:recipe_foods, :user).where(public: true).order(id: :desc)
    @recipe_foods = RecipeFood.includes(:food).where(recipe_id: @recipes.ids)
  end
end
