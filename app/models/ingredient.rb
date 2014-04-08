class Ingredient < ActiveRecord::Base
  attr_accessible :desc, :info, :name, :kind, :active
  has_many :amounts
  has_many :recipes, :through => :amounts
end
