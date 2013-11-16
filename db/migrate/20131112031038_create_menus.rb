class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :restaurant_id
      t.string :item
      t.integer :calories
      t.integer :fat
      t.integer :price
    end
  end
end
