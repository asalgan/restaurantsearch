class MenusController < ApplicationController

  def index
    @menus = Menu.get_by_location(params[:zip]) & Menu.where("calories <= '#{params[:calories]}' AND category = '#{params[:category]}' ")
    @categories = Category.all
    @favorite = Favorite.where(:user_id => current_user).pluck(:menu_id)

    if signed_in?
      @favorites = Favorite.where(:user_id => current_user.id).count
    else
      nil
    end

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
  end

  def destroy
    @menu = Menu.find_by(:id => params[:id])
    @menu.destroy
    redirect_to menus_url
  end

end
