class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
    	t.belongs_to :user
    	t.belongs_to :menu
    	t.integer :quantity,	 default: 0

      t.timestamps
    end
  end
end
