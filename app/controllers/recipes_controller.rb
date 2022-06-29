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

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.public = !@recipe.Public

    flash[:notice] = if @recipe.save
      'This recipe is now #{@recipe.public ? "public" : "private"}'
    else
      'failed to update recipe status'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    flash[:notice] = if @recipe.destroy
      'Recipe deleted successfully'
    else
      'Failed to delete recipe'
    end
    redirect_to recipes_path
  end

  private

  def autheniticate_and_show!(recipe)
    return if recipe.public

    authenticate_user!

    return unless recipe.user.id !=current_user.id

    flash[:notice] = 'You are not authorized to view this recipe'
    redirect_to public_recipes_path
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preperation_time, :cooking_time)
  end
end
