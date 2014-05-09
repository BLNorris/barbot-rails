class Dispenser < ActiveRecord::Base
  attr_accessible :position
  
  has_one :ingredient
end
