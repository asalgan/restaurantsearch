class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(:id => params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    
    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find_by(:id => params[:id])
  end

  def update
    @user = User.find_by(:id => params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    
    if @user.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find_by(:id => params[:id])
    @user.destroy
    redirect_to users_url
  end
end
