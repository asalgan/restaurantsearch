class Menu < ActiveRecord::Base

	has_many :favorites, :class_name => "Favorite", :foreign_key => :user_id
  has_many :users, :through => :favorites
  
end
