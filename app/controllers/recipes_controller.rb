class RecipesController < ApplicationController
  def new
    if !current_user
      redirect_to("/users/sign_up")
    end
    @recipe = Recipe.new()
  #@ingredients = Ingredient.all()
    
    Ingredient.all.each do |i|
      
      @recipe.amounts.build({:ingredient_id => i.id})
      
    end
    
  end
  
  def create
    if !current_user
      redirect_to("/users/sign_up")
    end
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
    if !current_user
      redirect_to("/users/sign_up")
    end
    @recipes = Recipe.all()
    
  end
  def all
    if !current_user
      redirect_to("/users/sign_up")
    end
    
    @recipes = Recipe.joins(:user).select("recipes.*, users.fname AS username")
    
  end
  
  def show
    if !current_user
      redirect_to("/users/sign_up")
    end
    @recipe = Recipe.find(params[:id])
    
  end
  
  def pour
    if !current_user
      redirect_to("/users/sign_up")
    end
    #do some pouring stuff with the recipe
    
    redirect_to("/recipes/all")
  end
end
