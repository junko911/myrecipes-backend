class Api::V1::CuisinesController < ApplicationController
  def index
    cusines = Cuisine.all
    render json: cusines
  end
end
