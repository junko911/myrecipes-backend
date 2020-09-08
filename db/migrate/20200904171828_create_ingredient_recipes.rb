class CreateIngredientRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_recipes do |t|
      t.integer :recipe_id
      t.integer :ingredient_id
      t.string :amount

      t.timestamps
    end
  end
end
