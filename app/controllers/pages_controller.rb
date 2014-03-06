class PagesController < ApplicationController

  def signup
    
  end

	def welcome
     UserMailer.welcome_email(params[:email]).deliver
     redirect_to root_path
   end
   
 end