class FoodsController < ApplicationController
  load_and_authorize_resource

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to foods_path, notice: 'Food was created successfully' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    authorize! :destroy, @food
    @food.destroy!

    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully deleted.' }
    end
  end

  private

  def food_params
    params.require(:food).permit(:food, :measurement_unit, :unit_price)
  end
end
