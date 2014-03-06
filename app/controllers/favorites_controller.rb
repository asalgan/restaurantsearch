class FavoritesController < ApplicationController

	 def add_item_to_user

    respond_to do |format|
      format.json do

          m = Menu.find_by(:id => params[:menu_id])
      		f = Favorite.new
          f.menu_id = m.id
          f.user_id = current_user.id
      		f.quantity += 1
      		f.save
      		render "1.html"

        # else

        #   m = Menu.find_by(:id => params[:menu_id])
        #   f = Favorite.new
        #   f.menu_id = m.id
        #   f.user_id = current_user(params[:id])
        #   f.quantity += 1
        #   f.save
        #   render :nothing => true

        # end
      end
    end
  end
end