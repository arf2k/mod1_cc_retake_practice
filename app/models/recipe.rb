class Recipe

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
       self.all.filter do |recipe|
        recipe.restaurants.count == 0
       end
    end



end 