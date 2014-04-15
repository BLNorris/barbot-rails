class PublicController < ApplicationController

  def index
    if user_signed_in?
      @recipes = Recipe.joins(:user).select("recipes.*, users.fname AS username")
      render  "recipes/index"
    end
  end
  
  def about
    respond_to do |format|
      format.html
      format.js
    end
  end
end