class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new()
    @ingredients = Ingredient.joins(:user).select("recipes.*, users.fname AS username")
    
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
  def index
    @recipes = Recipe.all()
    
  end
  def all
    @recipes = Recipe.joins(:user).select("recipes.*, users.fname AS username")
    
  end
  
  def show
    @recipe = Recipe.find(params[:id])
    
  end
end
