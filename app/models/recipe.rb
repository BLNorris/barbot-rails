class Recipe < ActiveRecord::Base
  attr_accessible :desc, :instructions, :name, :user_id, :ingredient_attributes, :ingredient_ids, :amounts_attributes, :rating
  has_many :amounts, :dependent => :destroy
  has_many :ingredients, :through => :amounts
  accepts_nested_attributes_for :amounts, :reject_if => lambda{ |a| a[:ml]=="0" ||  a[:ml].blank? }
  validates :name, presence: true
  validate :cannot_overfill_glass
  belongs_to :user
  
  def cannot_overfill_glass
    if self.amounts.map(&:ml).sum > 350
      errors.add(:amounts, " cannot have more than 350ml total")
    else
      
    end
    
  end
  
  def  reassign_to_deleted
    self.user_id = 0
  end
  
  def downvote
    if self.rating == nil
      self.rating = 0
    end
    self.rating--
    self.save
  end
  
  def upvote
    if self.rating == nil
      self.rating = 0
    end
    self.rating++
    self.save
  end
  
end
