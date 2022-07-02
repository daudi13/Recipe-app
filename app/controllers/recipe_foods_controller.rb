class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[destroy]

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
    @recipe_food.recipe_id = params[:recipe_id]
    @foods = Food.all
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new
    @recipe_food.recipe_id = params[:recipe_id]
    @recipe_food.food_id = params[:food_id]
    @recipe_food.quantity = params[:quantity]
    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_url(@recipe_food.recipe_id), notice: 'Recipe food was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.all
  end

  def update
    @recipe_food = RecipeFood.find_by(recipe_id: params[:id])
    @recipe_food.quantity = params[:quantity]
    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_url(@recipe_food.recipe_id), notice: 'Recipe food was successfully updated.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food.destroy

    respond_to do |format|
      format.html { redirect_to recipe_url(@recipe_food.recipe_id), notice: 'Recipe food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    # params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
