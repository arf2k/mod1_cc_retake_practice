# require and load the environment file
require_relative '../config/environment.rb'

# call this method to reload your models as you write code
def reload
  load 'config/environment.rb'
end

pasta = Recipe.new("Pasta", "Noodles with marina")
chicken = Recipe.new("fried chicken", "breaded chicken fried")
steak = Recipe.new("grilled steak", "ny strip in sauce")

pablo = RestaurantOwner.new("Pablo", 39)
antonio = RestaurantOwner.new("Antonio", 25)
marco = RestaurantOwner.new("Marco", 50)


marios = Restaurant.new(pablo, "Mario's", 3)
olives = Restaurant.new(antonio, "Olives", 2)
brickhouse = Restaurant.new(marco, "Brickhouse", 5)


golden_chicken = MenuItem.new(marios, chicken, 14.00)
ny_steak = MenuItem.new(olives, steak, 25.00)
red_chicken = MenuItem.new(olives, chicken, 16.00)
spaghetti = MenuItem.new(brickhouse, pasta, 30.00)





# ===== WARNING! DO NOT EDIT BELOW THIS LINE ===== #
binding.pry
0
