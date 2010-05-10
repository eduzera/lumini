class Admin::ProductsController < Admin::PublisherController
  layout "publisher_products"
  
  before_filter :put_last_controller_on_session
  
  def index

  end
  
  def new
    @product = Product.new
    @product.lang_product.build
    @product.images.build
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def create
    @product = Product.new(params[:product])
    @product.images.build
    
    if @product.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_product_url(@product)
    else
      render :action => 'new'
    end
  end
  
  def update
    
    params[:product][:existing_product_prize_attributes] ||= {}
    
      @product = Product.find(params[:id])
      if @product.update_attributes(params[:product])
        flash[:notice] = "Successfully updated contact."
        redirect_to admin_product_url(@product)
      else
        render :action => 'edit'
      end
  end
    
  def add_new_language
    
    render :partial => "add_new_language", :locals => { :lang_product => LangProduct.new }

  end
    
  def add_new_prize
    
    render :partial => "add_new_prize", :locals => { :product_prize => ProductPrize.new}
    
  end
    
  def destroy
    
    @product = Product.find(params[:id])
    @product.destroy
    
    redirect_to admin_products_path
  end
  
  def put_last_controller_on_session 
        session[:last_controller] = self.controller_name
  end

end
