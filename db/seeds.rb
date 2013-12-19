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


  def fetch_excel_data
      ex = Roo::Excel.new("public/fooditems.xls")
      ex.default_sheet = ex.sheets[0] #Mention the sheet number
      2.upto(527) do |line| #start and end of row
      item = ex.cell(line,'A')
      calories = ex.cell(line,'B')
      fat = ex.cell(line,'C')
      carbs = ex.cell(line,'D')
      category = ex.cell(line,'E')
      restaurant = ex.cell(line,'F')
      @menu = Menu.create(:item => item,:calories => calories,:fat => fat,:carbs => carbs,:category => category,:restaurant => restaurant)
  end
  end

    def fetch_restaurants
      ex = Roo::Excel.new("public/restaurants.xls")
      ex.default_sheet = ex.sheets[0] #Mention the sheet number
      2.upto(11) do |line| #start and end of row
      name = ex.cell(line,'A')
      @restaurant = Restaurant.create(:name => name)
  end
  end

  fetch_excel_data
  fetch_restaurants