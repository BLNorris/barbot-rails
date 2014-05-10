class Dispenser < ActiveRecord::Base
  attr_accessible :position, :ingredient
  
  has_one :ingredient
  
  #validates :ingredient,  uniqueness: true
end
