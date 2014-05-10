class DispensersController < ApplicationController
  def update
    errors = false
    @data = params["dispenser"]
    @data.each do |d|
    
      dispenser = Dispenser.find_by_position(d[0])

      dispenser.ingredient = Ingredient.find(d[1]) unless (d[1] == "")
    
      if dispenser.save 
        
      else
        errors = true
      end
      
    end
    
    if !errors
      redirect_to("/admin")
    else
      render "/admin/bot_config"
    end
  end
end
