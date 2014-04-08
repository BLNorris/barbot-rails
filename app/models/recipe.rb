class Recipe < ActiveRecord::Base
  attr_accessible :desc, :instructions, :name, :user_id, :ingredients_attributes
  has_many :amounts
  has_many :ingredients, :through => :amounts
  accepts_nested_attributes_for :amounts
end
