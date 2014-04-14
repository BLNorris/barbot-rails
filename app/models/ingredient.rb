# Stores information related to a specific ingredient
# 
# name - The name
# desc - Description of ingredient
# kind - Th kind. eg Liquor, Mixer, Garnish
# info - Special info needed
# active - Is ingredient available for use?
#
#
class Ingredient < ActiveRecord::Base
  attr_accessible :desc, :info, :name, :kind, :active
  has_many :amounts
  has_many :recipes, :through => :amounts
  validates :name, presence: true
end
