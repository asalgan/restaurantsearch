class FavoritesController < ApplicationController

	def add_item_to_user

    user = current_user
    favorite = Favorite.where(:user_id => user.id).pluck(:menu_id)

    m = Menu.find_by(:id => params[:menu_id])

      if Favorite.me
        nil
      else

      f = Favorite.new
      f.menu_id = m.id
      f.user_id = current_user.id
      f.quantity += 1

    if f.save
    respond_to do |format|
      format.js do
          render :nothing => true

        end
      end
    end
  end
  end
end