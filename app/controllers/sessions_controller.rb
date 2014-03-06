class SessionsController < ApplicationController

  def new
  end
  
  # def omniauth_destroy
  #   session[:user_id] = nil
  #   redirect_to root_url
  # end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        sign_in user
        redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  def omniauth_create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

end