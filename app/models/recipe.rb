class Recipe
    # CARYN SAYS: great overall! couple of notes below
    attr_reader :name 
    attr_accessor :description
    @@all = []

    def initialize(name, description)
        @name = name
        @description = description
        @@all << self
    end

    def self.all
        @@all
    end

    def menu_items
        MenuItem.all.select{|menu| menu.recipe == self}
    end

    def restaurants
        menu_items.map{|menu| menu.restaurant}
    end

    def average_price
        # CARYN SAYS: both of these methods look fine, but make sure you comment one out!
        menu_sum = self.menu_items.map{|menu| menu.price}.sum
        menu_sum/ self.menu_items.count   

        self.menu_items.reduce(0) do |sum, menu|
            sum + menu.price
        end / self.menu_items.count

    end

    def highest_price
        self.menu_items.map{|menu| menu.price}.max 
    end

    def cheapest_restaurant
        # CARYN SAYS: you can also use the enum min_by to help you here! 
        cheapest_menu = self.menu_items.reduce do |menu1, menu2|
            if menu1.price < menu2.price 
                menu1 
            else 
                menu2
            end
        end
        cheapest_menu.restaurant
    end

    def self.inactive
        # CARYN SAYS: nice! this logic was tough for a few people! How long did it take you to think through? 
        self.all.filter do |recipe|
            recipe.restaurants.count == 0
        end
    end



end 