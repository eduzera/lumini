class Admin::ImagesController < ApplicationController

  layout "publisher_images"
  
  before_filter :find_parent, :except => :update_order
 
  
  def show
    @images = Image.all_with_filter(params[:imageable_type].capitalize, params[:type]).by_imageable_id(params[:id]).by_order
    @image = @klass.find(params[:id]).images.new
    @types = ImageType.all_with_filter(@klass.name.capitalize)
    
    unless @images.last.nil? || @images.last.priority.nil?
      @image.priority = (@images.last.priority) +1
    else
       @image.priority = 0
    end
  end
  
 def create
    @image = Image.create(params[:image])
    respond_to do |format|
      format.html { redirect_to :back }
    end
  end
  
  def destroy
    imgs=[]
    @image = Image.find(params[:id])    
    @image.destroy
  
    @images = Image.all_with_filter(@image.imageable_type, @image.image_type.name).by_imageable_id(@image.imageable_id).by_order 
    
    @images.each{ |pic| imgs.push pic.id}
    Image.update_order(imgs)
    
    redirect_to admin_images_path(@klass, @image.imageable_id, @image.image_type.name)
  end

  def update_order
    image_list = (params[:order].split(',')) 
    Image.update_order(image_list)
    render :text => "Ok"
  end

  private

  def find_parent    
    @klass = params[:imageable_type]
    @klass = params[:image][:imageable_type] if @klass.nil?
    @klass = @klass.capitalize.constantize
  end
end
