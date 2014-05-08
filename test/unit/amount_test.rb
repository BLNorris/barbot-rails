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

require 'test_helper'

class AmountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
