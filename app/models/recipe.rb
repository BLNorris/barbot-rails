class Recipe < ActiveRecord::Base
  attr_accessible :desc, :instructions, :name, :user_id, :ingredient_attributes, :ingredient_ids, :amounts_attributes
  has_many :amounts, :dependent => :destroy
  has_many :ingredients, :through => :amounts
  accepts_nested_attributes_for :amounts, :reject_if => lambda{ |a| a[:ml]=="0" ||  a[:ml].blank? }
  validates :name, presence: true
  validate :cannot_overfill_glass
  
  def cannot_overfill_glass
    if self.amounts.map(&:ml).sum > 350
      errors.add(:amounts, " cannot have more than 350ml total")
    else
      
    end
    
  end
end
