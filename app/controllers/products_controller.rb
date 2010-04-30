class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @images = Image.by_imageable_type(@product.class.name.capitalize).group_image_type

    respond_to do |format|
      format.iphone {render :layout => false}
    end
  end
end