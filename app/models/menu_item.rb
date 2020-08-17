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
        # CARYN SAYS: good!!
        self.restaurant.restaurant_owner
    end

    def self.most_expensive_item
        # CARYN SAYS: right now, this will return the amount and not the MenuItem instance
        # can you fix that? 
        array = MenuItem.all.collect{|menu| menu.price}
        array.max
    end


end