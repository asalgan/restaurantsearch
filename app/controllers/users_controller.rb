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
    @user = User.new
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.password_confirmation = params[:password_confirmation]
    
    if @user.save
      session[:user_id] = @user.id
      # redirect_to root_url
    else
      render 'new'
    end

    respond_to do |format|
      if @user.save
      UserMailer.welcome(@user).deliver
      format.html {redirect_to root_url, notice: "Thanks for signing up!"}
    end
    end
  end

  def edit
    @user = User.find_by(:id => params[:id])
    if params[:id] =! session[:user_id]
      redirect_to root_url
    end
  end

  def update
    @user = User.find_by(:id => params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    
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
    if params[:id] =! session[:user_id]
      redirect_to root_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
