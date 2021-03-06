class ProductsController < ApplicationController
  def show
    @product = Product.all_with_filter.by_language(session[:language]).find(params[:id])
    @category = Category.active(session[:language]).find(@product.category_id)
    @images = Image.by_imageable_type(@product.class.name.capitalize).by_imageable_id(params[:id]).group_image_type
    @designer = Designer.by_product(params[:id]).by_language(session[:language]).first
    @prizes = Prize.by_product(params[:id]).by_language(session[:language])
    
    respond_to do |format|
      format.iphone {render :layout => false}
    end
  end
end