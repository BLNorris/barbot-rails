class Amount < ActiveRecord::Base
  attr_accessible :ingredient_id, :ml, :recipe_id
  belongs_to :ingredient
  belongs_to :recipe
  validates :ml, numericality: { only_integer: true, greater_than: 0 }
end
