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
    
    def edit
      @ingredient = Ingredient.find(params[:id])
    end
    
    def update
      @ingredient = Ingredient.find(params[:id])
      @ingredient.update_attributes(params[:ingredient])
      
      if @ingredient.savw
        redirect_to("/admin")
      else
        render "new"
      end
    end
    
    def index
      @ingredients = Ingredient.all()
    end
end
