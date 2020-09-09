class Api::V1::CuisinesController < ApplicationController
  def index
    cusines = Cuisine.all
    render json: cusines
  end
  
  def show
    recipe_ids = Ingredient.where('name LIKE ?', "%#{params[:ingredient]}%").map(&:recipe_ids).flatten if params[:ingredient].present?
    recipes = Cuisine.find_by(name: params[:id]).recipes
    recipes = recipes.where(id: recipe_ids) if recipe_ids.present?
    recipes = recipes.select(&:dairy_free?) if params[:dairy_free].present?
    recipes = recipes.select(&:egg_free?) if params[:egg_free].present?
    recipes = recipes.select(&:nut_free?) if params[:nut_free].present?
    render json: recipes.to_json(include: :ingredients)
  end
end
