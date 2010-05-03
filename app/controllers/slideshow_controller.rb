class SlideshowController < ApplicationController
  
  def show
    if params[:id].nil?
      @slideshow = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).by_product_category(params[:category_id]).first
    else
      @slideshow = Image.by_imageable_type(params[:imageable_type]).find(params[:id])
    end
    
    respond_to do |format|
      format.html {render :layout => false}
    end 
  end
end
