# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'

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

API_KEY = 'fd16995de3f7470ebd088405c7348ac0'
cuisine_url = "https://api.spoonacular.com/recipes/complexSearch?#{cuisine}=italian&apiKey=#{API_KEY}"
information_url = "https://api.spoonacular.com/recipes/#{id}/information?apiKey=#{API_KEY}"
ingredients_url = "https://api.spoonacular.com/recipes/#{id}/ingredientWidget.json?apiKey=#{API_KEY}"
response = RestClient.get(API_URL)
byebug
data = JSON.parse(response)


# animals_response = RestClient.get("http://localhost:3000/animals")
# animals_data = JSON.parse(animals_response)

# users_data.each do |user_hash|
#     User.create(user_hash)
# end

# animals_data.each do |animal_hash|
#     Animal.create(animal_hash)
# end

