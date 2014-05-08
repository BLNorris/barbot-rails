# == Schema Information
#
# Table name: amounts
#
#  id            :integer          not null, primary key
#  ml            :integer
#  ingredient_id :integer
#  recipe_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Amount < ActiveRecord::Base
  attr_accessible :ingredient_id, :ml, :recipe_id, :name
  attr_accessor :name
  belongs_to :ingredient
  belongs_to :recipe
  validates :ml, numericality: { only_integer: true, greater_than: 0 }
end
