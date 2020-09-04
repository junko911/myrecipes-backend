class Recipe < ApplicationRecord
    has_many: ingredientrecipes
    has_many :ingredients, through: :ingredientrecipes
    has_many :comments
    belongs_to :cuisine
end
