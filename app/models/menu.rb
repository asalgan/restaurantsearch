class Menu < ActiveRecord::Base
	belongs_to :restaurant, :class_name => "Restaurant", :foreign_key => :restaurant_id, :foreign_key => :category_name
end
