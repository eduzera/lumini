class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
        
    respond_to do |format|
      format.iphone {render :layout => false}
    end
  end
  
  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_path
    else
      render new_admin_products_path
    end
  end
  
  def update
      @product = Product.find(params[:id])
      if @product.update_attributes(params[:product])
        flash[:notice] = "Successfully updated contact."
        redirect_to admin_path
      else
        render edit_admin_product_url(@product)
      end
    end
end
