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

require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
