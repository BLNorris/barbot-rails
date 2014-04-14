class PublicController < ApplicationController

  def index
    if user_signed_in?
      redirect_to "/recipes/all", format: 'js'
    end
  end
  
  def about
    respond_to do |format|
      format.html
      format.js
    end
  end
end