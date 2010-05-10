class CategoriesController < ApplicationController
  def index
    puts '*' * 40
    puts session[:language]
    @categories = Category.active(session[:language])
    
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
end
