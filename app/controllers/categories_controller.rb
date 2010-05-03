class CategoriesController < ApplicationController
  def index
    @categories = Category.active(session[:language])
    
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
end
