class RecipesController < ApplicationController
  
  def new
    validate_user()
    @recipe = Recipe.new()
    
    Ingredient.all.each do |i|
      @recipe.amounts.build({:ingredient_id => i.id, :name =>i.name})
    end    
  end
  
  def create
    validate_user()
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = current_user.id
    #@recipe.rating = 0
    
    if @recipe.save  
      redirect_to("/")
    else
      render "new"
    end  
  end
  
  def edit
    validate_user()
    @recipe = Recipe.find(params[:id])
    
    Ingredient.all.each do |i|
      @recipe.amounts.build({:ingredient_id => i.id, :name =>i.name})
    end    
  end
  
  def update
    validate_user()
    @recipe = Recipe.update_attributes(params[])
    @recipe.user_id = current_user.id
    #@recipe.rating = 0
    
    if @recipe.save  
      redirect_to("/")
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
    @amounts = Amount.joins(:ingredient).where(:recipe_id => params[:id]).select("amounts.*, ingredients.name as iname")
  end
  
  def pour
    validate_user()
    #do some pouring stuff with the recipe
    bot = Robot.new
    puts "here"
    if bot.connect
      unpoured = bot.send(Recipe.find(params[:id]))
      if unpoured
        flash[:alert] = "Pouring drink, please add the following when done"
        unpoured.each do |u|
          flash[:alert] = flash[:alert] + ", " + u[0] + ": " + u[1].to_s + "ml"
        end
      else
        flash[:alert] = "Pouring drink, please be patient"
      end
      redirect_to("/")
    else
      flash[:alert] = "BarBot not connected."
      redirect_to("/")
    end
    
    
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
    redirect_to(recipe_path(@recipe.id()))
  end
  
  def validate_user
    if !current_user
      redirect_to("/users/sign_up")
    end
  end
end
