class GaleriesController < ApplicationController
  def index
    @galeries = Image.by_imageable_type(params[:imageable_type]).by_imageable_id(params[:id]).by_image_type(params[:name])
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
  
  
  def show
    if params[:id].nil?
      @image = Image.by_imageable_type(params[:imageable_type]).by_imageable_id(params[:imageable_id]).by_image_type(params[:name]).first
  #  end
   else
      @image = Image.by_imageable_type(params[:imageable_type]).by_imageable_id(params[:imageable_id]).find(params[:id])
    end
    
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
  
  def changeimage
    if params[:direction] == "next"
      @image = Image.by_imageable_type(params[:imageable_type]).by_imageable_id(params[:imageable_id]).by_image_type(params[:name]).find(:first, :conditions => ['images.id > ?', params[:id]])
    else
      @image = Image.by_imageable_type(params[:imageable_type]).by_imageable_id(params[:imageable_id]).by_image_type(params[:name]).find(:last, :conditions => ['images.id < ?', params[:id]])
    end

    if @image.nil?
      if params[:direction] == 'previous'
        @image = Image.by_imageable_type(params[:imageable_type]).by_imageable_id(params[:imageable_id]).by_image_type(params[:name]).last
      else
        @image = Image.by_imageable_type(params[:imageable_type]).by_imageable_id(params[:imageable_id]).by_image_type(params[:name]).first
      end
    end

    redirect_to galery_path(@image.imageable_id, @image.imageable_type.downcase, @image.image_type.name, @image)
  end
  
  
  def slideshow_changeimage
    if params[:direction] == "next"
      @image = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).by_product_category(params[:category_id]).find(:first, :conditions => ['imageable_id > ?', params[:id]])
    else
      @image = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).by_product_category(params[:category_id]).find(:last, :conditions => ['imageable_id < ?', params[:id]])
    end

    if @image.nil?
      if params[:direction] == 'previous'
        @image = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).by_product_category(params[:category_id]).last
      else
        @image = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).by_product_category(params[:category_id]).first
      end
    end

    redirect_to slideshow_path(@image.imageable_type, @image.image_type.name, @image)
  end
  
  
  private
  
  def fix
    params[:imageable_type] = params[:imageable_type].capitalize
  end
end