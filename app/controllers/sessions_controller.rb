class SessionsController < ApplicationController

  def new
  end

  def destroy
    sign_out
    redirect_to root_url
  end
  
  # def omniauth_destroy
  #   session[:user_id] = nil
  #   redirect_to root_url
  # end

  def create
    user = User.find_by(email: params[:email])
    if user.present?
      if user.authenticate(params[:password])
        # Yay!
        sign_in user
        redirect_to root_url
      else
        redirect_to login_url, notice: "Incorrect username or password"
      end
    else
      redirect_to login_url, notice: "Incorrect username or password"
    end
    
  end

  def omniauth_create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

end