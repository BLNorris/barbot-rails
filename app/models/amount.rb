# Join model for recipes and ingredients
# 
# ml - the ammount for this association in ml
#
class Amount < ActiveRecord::Base
  attr_accessible :ingredient_id, :ml, :recipe_id, :name
  attr_accessor :name
  belongs_to :ingredient
  belongs_to :recipe
  validates :ml, numericality: { only_integer: true, greater_than: 0 }
end
