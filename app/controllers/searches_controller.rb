class SearchesController < ApplicationController
  def index
    @search = Product.first
    
    respond_to do |format|
      format.iphone {render :layout => false}
    end
  end
end
