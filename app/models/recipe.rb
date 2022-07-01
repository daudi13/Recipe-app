class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  # validates :name, presence: true, length: { maximum: 50 }
  # validates :description, presence: true
  # validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  # valudates :preperation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
