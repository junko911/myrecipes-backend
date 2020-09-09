class Recipe < ApplicationRecord
    has_many :ingredient_recipes
    has_many :ingredients, through: :ingredient_recipes
    has_many :comments
    belongs_to :cuisine

    def dairy_free?
        ingredients.each do |ingredient|
            return false if !ingredient.dairy_free?
        end
        true
    end

    def egg_free?
        ingredients.each do |ingredient|
            return false if !ingredient.egg_free?
        end
        true
    end
    
    def nut_free?
        ingredients.each do |ingredient|
            return false if !ingredient.nut_free?
        end
        true
    end
end
