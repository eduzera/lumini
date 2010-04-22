class Admin::ImagesController < ApplicationController
  layout "admin"

  def new
    @image = Image.new
    @image.product_id = params[:product_id]
  end
  
  def show
    @images = Image.by_product(params[:id])
    
    @image = Image.new
    @image.product_id = params[:product_id]
  end
  
  def create
    @image = Image.new(params[:image])
    if @image.save!
      flash[:notice] = "Successfully created contact."
    else
      flash[:notice] = "ERRO."
    end
    
    respond_to do |format|
      format.html { redirect_to admin_path }
      format.js
    end
  end
end
