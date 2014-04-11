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
  
  def index
    if !current_user
      redirect_to("/users/sign_up")
    end
    @recipes = Recipe.joins(:user).select("recipes.*, users.fname AS username")
    
  end
  def all
    if !current_user
      redirect_to("/users/sign_up")
    end
    
    @recipes = Recipe.joins(:user).select("recipes.*, users.fname AS username")
    
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
    
    
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
  def upvote
    @recipe = Recipe.find(params[:id])
    if @recipe.rating == nil
      @recipe.rating = 0
    end
    @recipe.rating++
    @recipe.save
    respond_to do |format|
      format.html
      format.js
    end
  end
  def downvote
    @recipe = Recipe.find(params[:id])
    if @recipe.rating == nil
      @recipe.rating = 0
    end
    @recipe.rating--
    @recipe.save
    respond_to do |format|
      format.html
      format.js
    end
  end 
  def random
    
    @recipe = Recipe.offset(rand(Recipe.count)).first
    

    render("show")
  end
end
