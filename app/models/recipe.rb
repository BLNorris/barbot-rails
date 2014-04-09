class Recipe < ActiveRecord::Base
  attr_accessible :desc, :instructions, :name, :user_id, :ingredient_attributes, :ingredient_ids, :amounts_attributes
  has_many :amounts, :dependent => :destroy
  has_many :ingredients, :through => :amounts
  accepts_nested_attributes_for :amounts, :reject_if => lambda{ |a| a[:ml]=="0" ||  a[:ml].blank? }
end
