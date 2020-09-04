class Recipe < ApplicationRecord
    has_many: ingredientrecipes
    has_many :ingredients, through: :ingredientrecipes
end
