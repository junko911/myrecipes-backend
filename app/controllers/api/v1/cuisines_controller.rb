class Api::V1::CuisinesController < ApplicationController
  def index
    cusines = Cuisine.all
    render json: cusines
  end
  
  def show
    recipes = Cuisine.find_by(name: params[:id]).recipes
    render json: recipes
  end

end
