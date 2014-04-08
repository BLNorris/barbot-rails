class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new()
    @ingredients = Ingredient.all()
    
  end
end
