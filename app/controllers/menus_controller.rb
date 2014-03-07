class MenusController < ApplicationController

  def index
    @menus = Menu.where("calories <= '#{params[:calories]}' AND category = '#{params[:category]}' ").sample(300).sort
    # @random = @menus.sample
    @categories = Category.all

    if signed_in?
      @favorite = Favorite.where(:user_id => current_user.id).count
    end
   
   # @restaurants = @menus.group_by(&:restaurant).map{|k, v| v.first}
   # @restaurants = @menus.each {:restaurant}.uniq
   # @items = @menus.find_all{ |restaurant| @menus.collect.restaurant == restaurant }
   # @restaurants = Menu.where("calories <= '#{params[:calories]}' AND category = '#{params[:category]}' ").group_by(&:restaurant).map{|k, v| v.first}
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
