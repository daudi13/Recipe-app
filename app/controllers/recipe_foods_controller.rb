class RecipeFoodsController < ApplicationController
  def new
    @foods = current_user.foods
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    new_recipe_item = RecipeFood.new
    new_recipe_item.quantity = params[:recipe_food][:quantity]
    recipe = Recipe.find(params[:recipe_id])
    food = Food.find(params[:recipe_food][:food])
    new_recipe_item.recipe_id = recipe.id
    new_recipe_item.food_id = food.id

    if new_recipe_item.save
      flash[:notice] = 'Ingredient successfully added'
      redirect_to recipe_path(recipe)
    else
      flash[:notice] = 'Ingredient not added'
      render :new
    end
  end
end
