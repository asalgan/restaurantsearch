class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy



  def new
    @user = User.new
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @categories = Category.all

    user = current_user
    @favorite = Favorite.where(:user_id => user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation) 
  end

   #Before filters

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to '/signin', notice: "Please sign in." 
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end