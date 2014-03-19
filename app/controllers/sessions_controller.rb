class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        sign_in user
        redirect_back_or root_url
    else
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    sign_out
    redirect_to root_url
  end

  def omniauth_create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    sign_in user
    redirect_to root_url
  end

  # def omniauth_destroy
  #   session[:user_id] = nil
  #   redirect_to root_url
  # end

end