class Recipe < ActiveRecord::Base
  attr_accessible :desc, :instructions, :name, :user_id
  has_many :amounts
  has_many :ingredients, :through => :amounts
end
