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
    MenuItem.all.select do |menu|
        menu.recipe == self
    end
end

def restaurants
   menu_items.map do |menu|
        menu.restaurant
    end
end

def average_price
    menu_sum = self.menu_items.map{|menu| menu.price}.sum
        menu_sum/ self.menu_items.count
        end
    end

def highest_price
    prices = self.menu_items.map{|menu| menu.price}
    prices.sort 
end