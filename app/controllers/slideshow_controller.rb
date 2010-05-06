class SlideshowController < ApplicationController
  def index
     @slideshows = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).by_product_category(params[:category_id]).by_cover

    respond_to do |format|
     format.iphone {render :layout => false}
    end
  end
  
  
  def show
    if params[:id].nil?
      @slideshow = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).by_product_category(params[:category_id]).by_cover.first
    else
      @slideshow = Image.by_imageable_type(params[:imageable_type]).by_cover.find(params[:id])
    end
    
    respond_to do |format|
      format.iphone {render :layout => false}
    end 
  end
end
