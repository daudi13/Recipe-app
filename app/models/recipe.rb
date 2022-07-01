class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  def total
    price = 0
    recipe_foods.each { |food_item| price += food_item.quantity * food_item.food.price }
  end
end
