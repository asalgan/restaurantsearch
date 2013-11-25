class MenusController < ApplicationController

  def index
     #@menus = Menu.where(['calories <= ?', params[:calories].to_i]) && Menu.where(['fat <= ?', params[:fat].to_i])
     @menus = Menu.where("calories <= '#{params[:calories]}' AND fat <= '#{params[:fat]}' ")
  end

  def show
    @menu = Menu.find_by(:id => params[:id])
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new
    @menu.restaurant_id = params[:restaurant_id]
    @menu.item = params[:item]
    @menu.calories = params[:calories]
    @menu.fat = params[:fat]
    @menu.category = params[:category]
    @menu.price = params[:price]
    
    if @menu.save
      redirect_to menus_url
    else
      render 'new'
    end
  end

  def edit
    @menu = Menu.find_by(:id => params[:id])
  end

  def update
    @menu = Menu.find_by(:id => params[:id])
    @menu.restaurant_id = params[:restaurant_id]
    @menu.item = params[:item]
    @menu.calories = params[:calories]
    @menu.fat = params[:fat]
    @menu.price = params[:price]
    
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
