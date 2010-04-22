class GaleriesController < ApplicationController
  def index
    @galeries = Image.by_product(params[:product_id])
    
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
  
  
  def show
    @image = Image.find(params[:id])
    
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
  
end
