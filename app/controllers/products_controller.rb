class ProductsController < ApplicationController
  def show
    @product = Product.all_with_filter.by_language(session[:language]).find(params[:id])
    @images = Image.by_imageable_type(@product.class.name.capitalize).by_imageable_id(params[:id]).group_image_type

    respond_to do |format|
      format.iphone {render :layout => false}
    end
  end
end