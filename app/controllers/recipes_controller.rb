class RecipesController < ApplicationController
  
  def new
    @recipe = Recipe.new()
    
    Ingredient.all.each do |i|
      @recipe.amounts.build({:ingredient_id => i.id})
    end    
  end
  
  def create
    validate_user()
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = current_user.id
    
    if @recipe.save  
      redirect_to("/recipes")
    else
      render "new"
    end  
  end
  
  def index
    validate_user()
    @recipes = Recipe.joins(:user).select("recipes.*, users.fname AS username")
    
    respond_to do |format|
      format.html { render '_index', locals: {recipes: @recipes}} 
      format.js
    end  
  end
  
  def show
    validate_user()
    @recipe = Recipe.find(params[:id])
    @amounts = Amount.where(:recipe_id => params[:id]).joins(:ingredient).select("amounts.*, ingredients.name as name")
  end
  
  def pour
    validate_user()
    #do some pouring stuff with the recipe
    
    redirect_to("/recipes")
  end
  
  def upvote
    @recipe = Recipe.find(params[:id])
    @recipe.upvote()
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def downvote
    @recipe = Recipe.find(params[:id])
    @recipe.downvote()
    respond_to do |format|
      format.html
      format.js
    end
  end 
  
  def random
    @recipe = Recipe.offset(rand(Recipe.count)).first
    render("show")
  end
  
  def validate_user
    if !current_user
      redirect_to("/users/sign_up")
    end
  end
end
