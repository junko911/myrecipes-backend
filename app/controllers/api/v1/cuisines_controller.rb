class Api::V1::CuisinesController < ApplicationController
  def index
    cusines = Cuisine.all
    render json: cusines
  end
  
  def show
    recipe_ids = Ingredient.where('name LIKE ?', "%#{params[:ingredient]}%").map(&:recipe_ids).flatten if params[:ingredient].present?
    recipes = Cuisine.find_by(name: params[:id]).recipes 
    recipes = recipes.where(id: recipe_ids) if recipe_ids.present?
    render json: recipes.to_json(include: :ingredients)
  end
end
