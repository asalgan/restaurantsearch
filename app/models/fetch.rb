require 'rubygems'
require 'roo'
# require 'menu'
require "../../config/environment"

  def fetch_excel_data
      ex = Roo::Excel.new("../../public/McDonalds.xls")
      ex.default_sheet = ex.sheets[0] #Mention the sheet number
      2.upto(270) do |line| #start and end of row
      item = ex.cell(line,'A')
      calories = ex.cell(line,'B')
      fat = ex.cell(line,'C')
      carbs = ex.cell(line,'D')
      @menu = Menu.create(:item => item,:calories => calories,:fat => fat,:carbs => carbs)
      puts @menu.inspect
  end
  end

  fetch_excel_data

 
 
