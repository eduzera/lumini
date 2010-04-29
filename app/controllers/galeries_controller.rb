class GaleriesController < ApplicationController
  def index
    @galeries = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name])
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
  
  
  def show
    if params[:id].nil?
      @image = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).first
    else
      @image = Image.by_imageable_type(params[:imageable_type]).find(params[:id])
    end
    
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
  
  def changeimage
    if params[:direction] == "next"
      @image = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).find(:first, :conditions => ['images.id > ?', params[:id]])
    else
      @image = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).find(:last, :conditions => ['images.id < ?', params[:id]])
    end

    if @image.nil?
      if params[:direction] == 'previous'
        @image = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).last
      else
        @image = Image.by_imageable_type(params[:imageable_type]).by_image_type(params[:name]).first
      end
    end

    redirect_to galery_path(@image.imageable_type, @image.id)
  end
  
  
  private
  
  def fix
    params[:imageable_type] = params[:imageable_type].capitalize
  end
end
