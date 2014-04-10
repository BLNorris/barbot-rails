class IngredientsController < ApplicationController
    def new

      @ingredient = Ingredient.new()
    
    end
    
    def create
      
      @ingredient = Ingredient.new(params[:ingredient])
      
      if @ingredient.save

        redirect_to("/admin")

      else
        render "new"
      end
    end
    def index
      @ingredients = Ingredient.all()
    end
  
end
