class AddCategoryToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :category, :string
  end
end
