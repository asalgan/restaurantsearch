class MenusController < ApplicationController

  def index
     @menu = Menu.all
     @menus = Menu.where("calories <= '#{params[:calories]}' AND category = '#{params[:category]}' ").sample(30)
     @random = @menus.sample
     @categories = Category.all
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def create
  end

  def edit
    @menu = Menu.find_by(:id => params[:id])
  end

  def update
    @menu = Menu.find_by(:id => params[:id])
    @menu.restaurant_id = params[:restaurant_id]
    @menu.item = params[:item]
    @menu.category = params[:category]
    @menu.calories = params[:calories]
    @menu.fat = params[:fat]
    @menu.price = params[:price]
    @menu.restaurant = params[:restaurant]
    
    if @menu.save
      redirect_to menus_url
    else
      render 'new'
    end
  end

  def destroy
    @menu = Menu.find_by(:id => params[:id])
    @menu.destroy
    redirect_to menus_url
  end

end
