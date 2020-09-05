# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

API_KEY = 'fd16995de3f7470ebd088405c7348ac0'
cuisines = [
  'african',
  'american',
  'british',
  'cajun',
  'caribbean',
  'chinese',
  'eastern-european',
  'european',
  'french',
  'german',
  'greek',
  'indian',
  'irish',
  'italian',
  'japanese',
  'jewish',
  'korean',
  'latin-american',
  'mediterranean',
  'mexican',
  'middle-eastern',
  'nordic',
  'southern',
  'spanish',
  'thai',
  'vietnamese'
]

cuisines.each do |cuisine|
  new_cuisine = Cuisine.create!(name: cuisine)
  cuisine_url = "https://api.spoonacular.com/recipes/complexSearch?cuisine=#{cuisine}&apiKey=#{API_KEY}"
  cuisine_response = RestClient.get(cuisine_url)
  cuisine_data = JSON.parse(cuisine_response)["results"]
  
  cuisine_data.each do |recipe|
    information_url = "https://api.spoonacular.com/recipes/#{recipe["id"]}/information?apiKey=#{API_KEY}"
    information_response = RestClient.get(information_url)
    recipe_content_data = JSON.parse(information_response)["instructions"]
    new_recipe = Recipe.create!(title: recipe["title"], image: recipe["image"], content: recipe_content_data, likes: 0, cuisine_id: new_cuisine.id)
  end
  puts "Cuisine #{cuisine} and 10 recipes created"
end
# ingredients_url = "https://api.spoonacular.com/recipes/716426/ingredientWidget.json?apiKey=#{API_KEY}"
# ingredients_response = RestClient.get(ingredients_url)
# ingredients_data = JSON.parse(ingredients_response)["ingredients"]
# end
# ingredients_data.each_with_object([]) do |e, array| array << {e["name"] => e["amount"]["us"]} end
#   puts JSON.parse(recipe_info)
# end

# byebug
# 'something'



# animals_response = RestClient.get("http://localhost:3000/animals")
# animals_data = JSON.parse(animals_response)

# users_data.each do |user_hash|
#     User.create(user_hash)
# end

# animals_data.each do |animal_hash|
#     Animal.create(animal_hash)
# end

