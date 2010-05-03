class Admin::ImagesController < ApplicationController

  layout "publisher_images"
  
  before_filter :find_parent
 
  
  def show
    @image = @klass.find(params[:id]).images.new
    @images = Image.all_with_filter(params[:imageable_type].capitalize, params[:type]).by_imageable_id(params[:id]) #conditions tira o to_a
    @types = ImageType.all_with_filter(@klass.name.capitalize)
  end
  
   def create
      @image = Image.create(params[:image])
      respond_to do |format|
        format.html { redirect_to :back }
      end
    end
    
    def destroy
      @image = Image.find(params[:id])
      @image.destroy
      redirect_to admin_images_path(@klass, @image.imageable_id, @image.image_type.name)
    end

  private

  def find_parent    
    @klass = params[:imageable_type]
    @klass = params[:image][:imageable_type] if @klass.nil?
    @klass = @klass.capitalize.constantize
  end
end
