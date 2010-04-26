class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @images = Image.name_by_product(@product)
    respond_to do |format|
      format.iphone {render :layout => false}
    end
  end
end
