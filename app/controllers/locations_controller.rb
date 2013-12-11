class LocationsController < ApplicationController

  def index
    if params[:search].present?
      @locations = Location.near(params[:search], 50, :order => :distance)
    else
      @locations = Location.all
    end
  end

  def show
    @location = Location.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @location = Location.new
    @location.address = params[:address]
    @location.latitude = params[:latitude]
    @location.longitude = params[:longitude]
    
    if @location.save
      redirect_to locations_url
    else
      render 'new'
    end
  end

  def edit
    @location = Location.find_by(:id => params[:id])
  end

  def update
    @location = Location.find_by(:id => params[:id])
    @location.address = params[:address]
    @location.latitude = params[:latitude]
    @location.longitude = params[:longitude]
    
    if @location.save
      redirect_to locations_url
    else
      render 'new'
    end
  end

  def destroy
    @location = Location.find_by(:id => params[:id])
    @location.destroy
    redirect_to locations_url
  end
end
