class User < ApplicationRecord
  has_many :recipe, dependent: :destroy
  has_many :food, dependent: :destroy 
end