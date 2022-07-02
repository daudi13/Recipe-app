require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:all) do
    user = User.create(name: 'Test', email: 'test@mail.com', password: 'password', password_confirmation: 'password')
    @recipe = Recipe.new(name: 'Recipe 1', description: 'This is a recipe', cooking_time: 10, public: true, user: user)
    @food = Food.create(food: 'Food 1', measurement_unit: 'g', unit_price: 10, user_id: user)
    @recipe_food = RecipeFood.new(recipe: @recipe, food: @food, quantity: 10)
  end

  it 'should have a recipe' do
    @recipe_food.recipe = nil
    expect(@recipe_food).to_not be_valid

    @recipe_food.recipe = @recipe
    expect(@recipe_food).to be_valid
  end

  it 'should have a food' do
    @recipe_food.food = nil
    expect(@recipe_food).to_not be_valid

    @recipe_food.food = @food
    expect(@recipe_food).to be_valid
  end

  it 'should have a quantity' do
    @recipe_food.quantity = nil
    expect(@recipe_food).to_not be_valid

    @recipe_food.quantity = '10'
    expect(@recipe_food).to be_valid
  end
end
