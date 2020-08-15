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

    
#    def menu_items
#     menu_rest =MenuItem.all.select{[menu| menu.restaurant}
#         if menu_rest.inclue?(self.restaurants)
#             menu_rest.find


#     end

        
        

end