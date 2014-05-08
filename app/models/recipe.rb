# == Schema Information
#
# Table name: recipes
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  desc         :text
#  instructions :text
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  rating       :integer
#
class Recipe < ActiveRecord::Base
  attr_accessible :desc, :instructions, :name, :user_id, :ingredient_attributes, :ingredient_ids, :amounts_attributes, :rating
  has_many :amounts, :dependent => :destroy
  has_many :ingredients, :through => :amounts
  accepts_nested_attributes_for :amounts, :reject_if => lambda{ |a| a[:ml]=="0" ||  a[:ml].blank? }
  validates :name, presence: true
  validate :cannot_overfill_glass
  belongs_to :user
  
  
  # Validates that user cannot assign more ml than available
  # 
  def cannot_overfill_glass
    if self.amounts.map(&:ml).sum > 350
      errors.add(:amounts, " cannot have more than 350ml total")
    end
  end
  
  # Reassigns recipe to "DELETED" user when current user is deleted
  # 
  def  reassign_to_deleted
    self.user_id = 0
  end
  
  # Decrements rating for recipe
  #
  # Returns current rating
  def downvote
    if self.rating == nil
      self.rating = 0
    end
    self.rating-=1
    self.save
    self.rating
  end
  
  # Increments rating for recipe
  #
  # Returns current rating
  def upvote
    if self.rating == nil
      self.rating = 0
    end
    self.rating+=1
    self.save
    self.rating
  end
  
end
