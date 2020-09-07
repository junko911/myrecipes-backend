class Recipe < ApplicationRecord
    has_many :ingredient_recipes
    has_many :ingredients, through: :ingredient_recipes
    has_many :comments
    belongs_to :cuisine
end
