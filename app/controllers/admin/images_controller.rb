class Admin::ImagesController < ApplicationController
  layout "admin"

  def new
    @image = Image.new
  end
  
  def show
    @images = Image.by_product(params[:id])
  end
end
