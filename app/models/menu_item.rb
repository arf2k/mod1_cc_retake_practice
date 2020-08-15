class MenuItem
    attr_accessor :restaurant, :recipe, :price
    @@all = []

    def initialize(restaurant, recipe, price)
        @restaurant = restaurant
        @recipe = recipe
        @price = price
        @@all << self
    end

    def self.all 
        @@all
    end

    def owner
        self.restaurant.restaurant_owner
    end

    



end