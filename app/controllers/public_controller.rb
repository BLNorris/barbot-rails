class PublicController < ApplicationController

  def index

    if user_signed_in?
      redirect_to "/recipes/all"
    end
    
  end
  
  def about
    
  end
  
end