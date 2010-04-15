class Admin::ProductsController < ActionController::Base
  layout "admin"
  
  def new
    @product = Product.new
    @product.lang_product.build
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
  end
end
