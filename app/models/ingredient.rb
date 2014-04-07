class Ingredient < ActiveRecord::Base
  attr_accessible :desc, :info, :name, :type
  has_many :amounts
  has_many :recipes, :through => :amounts
end
