class RestaurantOwner
    attr_accessor :name, :age
    @@all = []

    def initialize(name, age)
        @name = name 
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def restaurants
        Restaurant.all.select do |restaurant|
            restaurant.restaurant_owner == self
        end
    end

    def recipes 
        restaurants.map do |restaurants|
            restaurants.recipes 
        end
    end

    def menu_items
        MenuItem.all.select do |menu|
        menu.owner == self  
        end
    end

   def self.average_age
        total = RestaurantOwner.all.collect{|owner| owner.age}
        total.sum / total.length
   end
        
   def sell_restaurant(restaurant, buyer)
    if self.restaurants.include?(restaurant)   
    restaurant_to_sell = self.restaurants.find{|restaurant| restaurant.restaurant_owner}
    restaurant_to_sell.restaurant_owner = buyer
    else
        "This is not your restaurant to sell"
    end
end

end