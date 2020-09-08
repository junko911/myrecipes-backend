class Ingredient < ApplicationRecord
    has_many :ingredient_recipes
    has_many :recipes, through: :ingredient_recipes

    def dairy_free?
        dairy_products = ['milk', 'yogurt', 'cream', 'butter', 'cheese', 'casein', 'custard', 'ice cream']
        dairy_products.each do |dairy|
            return true if name.include?(dairy) 
        end
        false
    end
end
