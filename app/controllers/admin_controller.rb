class AdminController < ApplicationController

  def index
  end
  
  def about
  end
  
  def bot_config
    @dispensers = Dispenser.all
    @options = []
    Ingredient.all().each do |i|
      @options << [i.name, i.id]
    end
  end
  
end