# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  desc       :text
#  kind       :string(255)
#  info       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  active     :boolean
#
class Ingredient < ActiveRecord::Base
  attr_accessible :desc, :info, :name, :kind, :active
  has_many :amounts
  has_many :recipes, :through => :amounts
  validates :name, presence: true
end
