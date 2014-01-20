class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(:id => params[:id])
    if params[:id] =! session[:user_id]
      redirect_to root_url
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to NoGylt"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find_by(:id => params[:id])
    @user.destroy
    redirect_to users_url
    if params[:id] =! session[:user_id]
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
