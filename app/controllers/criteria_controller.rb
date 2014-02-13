class CriteriaController < ApplicationController
	def index
		@disable_nav = true
		@menus = Menu.all
		@categories = Category.all
	end

	def show
    	@user = User.find_by(:name => params[:name])
    end

    def edit
    	@menu = Menu.find_by(:id => params[:id])
    end
end