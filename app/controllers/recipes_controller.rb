class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index
    @user = current_user
    @recipes = @user.recipes.all
  end

  def show; end
end
