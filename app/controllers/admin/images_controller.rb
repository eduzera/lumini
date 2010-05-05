class Admin::ImagesController < ApplicationController

  layout "publisher_images"
  
  before_filter :find_parent, :except => :update_order
 
  
  def show
    @image = @klass.find(params[:id]).images.new
    @images = Image.all_with_filter(params[:imageable_type].capitalize, params[:type]).by_imageable_id(params[:id]).by_order #conditions tira o to_a
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

    def update_order
      
      image_list = params[:order].split(',')

      for i in 0...image_list.length
        
        image = Image.find image_list[i].to_i
        image.priority = i unless image.nil?
        image.save
        
      end
      #/admin/images/update_order/:order

      render :text => "OK"
    end

  private

  def find_parent    
    @klass = params[:imageable_type]
    @klass = params[:image][:imageable_type] if @klass.nil?
    @klass = @klass.capitalize.constantize
  end
end
