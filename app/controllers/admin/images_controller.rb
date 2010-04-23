class Admin::ImagesController < ApplicationController
  layout "admin"

 # def new
 #   @image = Image.new
 #   @image.product_id = params[:product_id]
 # end
  
  def show
    @images = Image.by_product(params[:product_id], params[:imagetype])
    
    @image = Image.new
    @image.product_id = params[:product_id]
  end
  
  def create
    @image = Image.new(params[:image])
    #@image.image_type = ImageType.find_by_name(params[:imagetype])
    
    if @image.save!
      flash[:notice] = "Successfully created contact."
    else
      flash[:notice] = "ERRO."
    end
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
