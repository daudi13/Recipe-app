class RecipeFoodsController < ApplicationController
  def new
    @foods = current_user.foods
    @recipe = Recipe.find(params[:recipe_id])
  end

  
end
