class Ingredient < ApplicationRecord
    has_many :ingredient_recipes
    has_many :recipes, through: :ingredient_recipes

    def dairy_free?
        dairy_products = ['milk', 'yogurt', 'cream', 'butter', 'cheese', 'casein', 'custard', 'ice cream', 'feta']
        dairy_products.each do |dairy|
            return false if name.include?(dairy) 
        end
        true
    end
    
    def egg_free?
        if name.include?('eggplant')
            return true
        elsif name.include?('egg')
            return false
        end
        true
    end
    
    def nut_free?
        nuts = ['nut', 'almond', 'peacan', 'pistachio']
        nuts.each do |nut|
            return false if name.include?(nut) 
        end
        true
    end

    def shellfish_free?
        shellfish_ingredients = ['shrimp', 'crab', 'lobster', 'squid', 'oyster', 'scallops', 'mussels']
        shellfish_ingredients.each do |shellfish|
            return false if name.include?(shellfish) 
        end
        true
    end
end
