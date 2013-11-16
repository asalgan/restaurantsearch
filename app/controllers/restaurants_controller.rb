class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by(:id => params[:id])
  end

  def new
    @restuarant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new
    @restaurant.name = params[:name]
    @restaurant.location = params[:location]
    @restaurant.cuisine = params[:cuisine]
    
    if @restaurant.save
      redirect_to restaurants_url
    else
      render 'new'
    end
  end

  def edit
    @restaurant = Restaurant.find_by(:id => params[:id])
  end

  def update
    @restaurant = Restaurant.find_by(:id => params[:id])
    @restaurant.name = params[:name]
    @restaurant.location = params[:location]
    @restaurant.cuisine = params[:cuisine]
    
    if @restaurant.save
      redirect_to restaurants_url
    else
      render 'new'
    end
  end

  def destroy
    @restaurant = Restaurant.find_by(:id => params[:id])
    @restaurant.destroy
    redirect_to restaurants_url
  end
end
