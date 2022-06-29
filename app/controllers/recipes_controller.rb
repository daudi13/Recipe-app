class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @user = current_user
    @recipes = @user.recipes.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    authenticate_and_user!(@recipe)
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_path
    else 
      render 'new'
      flash[:notice] = 'Recipe not created'
  end
end
