class GaleriesController < ApplicationController
  def index
    @galeries = Image.by_product(params[:product_id], params[:name])
    
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
  
  def changeimage

    if params[:direction] == "next"
      @image = Image.by_product(params[:product_id], params[:name]).find(:first, :conditions => ['images.id > ?', params[:id]])
    else
      @image = Image.by_product(params[:product_id], params[:name]).find(:last, :conditions => ['images.id < ?', params[:id]])
    end

    if @image.nil?
      if params[:direction] == 'prev'
        @image = Image.by_product(params[:product_id], params[:name]).last
      else
        @image = Image.by_product(params[:product_id], params[:name]).first
      end
    end

    redirect_to product_galery_path(@image.product_id, @image.id)
  end
end
