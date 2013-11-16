class AddCarbsToMenus < ActiveRecord::Migration
  def change
  	add_column :menus, :carbs, :integer
  end
end
