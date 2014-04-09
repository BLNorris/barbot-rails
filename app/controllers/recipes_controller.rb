class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new()
    @ingredients = Ingredient.all()
    
  end
  
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = current_user.id
    @recipe.save
    
    amounts = params[:amount]

    redirect_to("/recipes/all")
  end
  
  def search
    
    
  end
  def all
    @recipes = Recipe.all()
    
  end
end
