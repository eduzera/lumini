class ImagesController < ApplicationController
  def create
    @image = Image.new(params[:image])
    if @image.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_path
    else
      flash[:notice] = "ERRO."
      redirect_to admin_path
    end
  end
end
