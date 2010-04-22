class Admin::ProductsController < ActionController::Base
  layout "admin"
  
  def new
    @product = Product.new
    @product.lang_product.build
    @product.product_prize.build
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
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
    
    def add_new_language
      
      render :partial => "add_new_language", :locals => { :lang_product => LangProduct.new }

    end
    
    def add_new_prize
      
      render :partial => "add_new_prize", :locals => { :product_prize => ProductPrize.new}
      
    end
    
end