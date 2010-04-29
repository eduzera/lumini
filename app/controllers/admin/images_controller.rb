class Admin::ImagesController < ApplicationController
  layout "admin"
  
  before_filter :find_parent
  
  def show
    @image = @klass.find(params[:id]).images.new
    @images = Image.all_with_filter(params[:imageable_type].capitalize, params[:type]) #conditions tira o to_a
  end
  
   def create
      @image = Image.create(params[:image])
      respond_to do |format|
        format.html { redirect_to :back }
      end
    end

  private

  def find_parent
    @klass = params[:imageable_type]
    @klass = params[:image][:imageable_type] if @klass.nil?
    @klass = @klass.capitalize.constantize
    #parent = klass.find(params[:imageable_id])
  end


 # def new
 #   @image = Image.new
 #   @image.product_id = params[:product_id]
 # end
  
#  def show
#    @images = Image.by_product(params[:product_id], params[:imagetype])
#    
#    @image = Image.new
#    @image.product_id = params[:product_id]
#  end
#  
#  def create
#    @product = Product.find params[:product_id]
#    @product.images =Image.new(params[:image])
#    #@image = Image.new(params[:image])
#    #@image.image_type = ImageType.find_by_name(params[:imagetype])
#    
#    if @product.save
#      flash[:notice] = "Successfully created contact."
#    else
#      flash[:notice] = "ERRO."
#    end
#    
#    respond_to do |format|
#      format.html { redirect_to :back }
#      format.js
#    end
#  end
#  
#  
#  def destroy
#    @image = Image.find(params[:id])
#    #@image.image_type = ImageType.find_by_name(params[:imagetype])
#    
#    if @image.destroy
#      flash[:notice] = "Successfully created contact."
#    else
#      flash[:notice] = "ERRO."
#    end
#    
#    respond_to do |format|
#      format.html { redirect_to :back }
#      format.js
#    end
#  end
end
