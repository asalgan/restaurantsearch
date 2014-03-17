# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'rubygems'
require 'roo'
# require 'menu'
# require "/config/environment"

Category.destroy_all
Menu.destroy_all
# Restaurant.destroy_all

Category.create(name: "American")
Category.create(name: "Bakery")
Category.create(name: "Beverages")
Category.create(name: "Brazilian")
Category.create(name: "Breakfast")
Category.create(name: "Burgers")
Category.create(name: "Chicken")
Category.create(name: "Chinese")
Category.create(name: "Coffee")
Category.create(name: "Desserts")
Category.create(name: "Greek")
Category.create(name: "Hot Dogs and Sausages")
Category.create(name: "Indian")
Category.create(name: "Japanese")
Category.create(name: "Kids Menu")
Category.create(name: "Mexican")
Category.create(name: "Middle Eastern")
Category.create(name: "Pasta")
Category.create(name: "Pizza")
Category.create(name: "Salad")
Category.create(name: "Sandwiches")
Category.create(name: "Seafood")
Category.create(name: "Sides")
Category.create(name: "Soup")
Category.create(name: "Steak")
Category.create(name: "Thai")
Category.create(name: "Vegetarian")

# Restaurant.create(name:"Applebee's")
# Restaurant.create(name:"Arby's")
# Restaurant.create(name:"Au Bon Pain")
# Restaurant.create(name:"Baja Fresh")
# Restaurant.create(name:"Chick-fil-A")
# Restaurant.create(name:"Corner Bakery Cafe")
# Restaurant.create(name:"Cosi")
# Restaurant.create(name:"Domino's Pizza")
# Restaurant.create(name:"Einstein Bros Bagels")
# Restaurant.create(name:"Jamba Juice")
# Restaurant.create(name:"Jason's Deli")
# Restaurant.create(name:"McDonald's")
# Restaurant.create(name:"McDonald's McCafe")
# Restaurant.create(name:"Noodles & Company")

  def fetch_excel_data
      ex = Roo::Excel.new("public/fooditems.xls")
      ex.default_sheet = ex.sheets[0] #Mention the sheet number
      2.upto(1961) do |line| #start and end of row
      item = ex.cell(line,'A')
      calories = ex.cell(line,'B')
      fat = ex.cell(line,'C')
      carbs = ex.cell(line,'D')
      category = ex.cell(line,'E')
      restaurant = ex.cell(line,'F')
      # category_id = ex.cell(line,'F')
      # restaurant = ex.cell(line,'F')
      @menu = Menu.create(:item => item,:calories => calories,:fat => fat,
              :carbs => carbs,:category => category,:restaurant => restaurant)
  end
end

  #   def fetch_restaurants
  #     ex = Roo::Excel.new("public/restaurants.xls")
  #     ex.default_sheet = ex.sheets[0] #Mention the sheet number
  #     2.upto(11) do |line| #start and end of row
  #     name = ex.cell(line,'A')
  #     @restaurant = Restaurant.create(:name => name)
  # end
  
  fetch_excel_data