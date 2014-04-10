class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new()
    @ingredients = Ingredient.all()
    
    Ingredient.all.each do |i|
      
      @recipe.amounts.build({:ingredient_id => i.id})
      
    end
    
  end
  
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = current_user.id
    
    
    if @recipe.save
      
      redirect_to("/recipes/all")
    else
      
      
      render "new"
    end
    
    
  end
  
  def search
    
    
  end
  def all
    @recipes = Recipe.all()
    
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    
  end
end
