require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:all) do
    user = User.create(name: 'Test', email: 'test@mail.com', password: 'password', password_confirmation: 'password')
    @recipe = Recipe.new(name: 'Recipe 1', description: 'This is a recipe', cooking_time: 10, public: true, user: user)
  end

  it 'should have a name' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid

    @recipe.name = 'Recipe 1'
    expect(@recipe).to be_valid
  end

  it 'should have a description' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid

    @recipe.description = 'This is a recipe'
    expect(@recipe).to be_valid
  end

  it 'should have a cooking time' do
    @recipe.cooking_time = nil
    expect(@recipe).to_not be_valid

    @recipe.cooking_time = 10
    expect(@recipe).to be_valid
  end

  it 'should have a user' do
    @recipe.user = nil
    expect(@recipe).to_not be_valid

    @recipe.user = User.create(name: 'Test', email: 'test@mail.com', password: 'password', password_confirmation: 'password')
    expect(@recipe).to be_valid
  end
end
