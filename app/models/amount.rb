class Amount < ActiveRecord::Base
  attr_accessible :ingredient_id, :ml, :recipe_id
  belongs_to :ingredient
  belongs_to :recipe
end
