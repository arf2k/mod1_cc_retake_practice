class Restaurant
    attr_accessor :restaurant_owner, :name, :star_rating
    @@all = []

    def initialize(restaurant_owner, name, star_rating)
        @restaurant_owner = restaurant_owner
        @name = name
        @star_rating = star_rating
        @@all << self
    end

    def self.all
        @@all
    end

    def menu_items
        MenuItem.all.select do |menu|
            menu.restaurant == self
        end
    end

    def recipes 
        menu_items.map do |menu|
            menu.recipe
        end
    end

    def has_dish?(recipe)
      if self.recipes.include?(recipe)
        true 
      else
        false
      end
    end

    def self.highest_rated
        self.all.reduce do |rest1, rest2|
            if rest1.star_rating > rest2.star_rating
                rest1 
            else
                rest2
            end
        end
    end
        

end