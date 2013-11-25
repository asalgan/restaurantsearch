class CriteriaController < ApplicationController
	def index
		@disable_nav = true
	end

	def show
    	@user = User.find_by(:name => params[:name])
    end
end