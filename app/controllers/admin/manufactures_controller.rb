class Admin::ManufacturesController < Admin::PublisherController
  
  layout "publisher_products"
  
  def index
    @manufacture = Manufacture.all
  end

  def new
    @manufacture = Manufacture.new
    @manufacture.lang_manufacture.build
  end

  def show
    @manufacture = Manufacture.find(params[:id])
  end

  def edit
    @manufacture = Manufacture.find(params[:id])
  end

  def create
    @manufacture = Manufacture.new(params[:manufacture])
    if @manufacture.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_manufacture_url(@manufacture)
    else
      render :action => 'new'
    end
  end

  def update
    @manufacture = Manufacture.find(params[:id])
    if @manufacture.update_attributes(params[:manufacture])
      flash[:notice] = "Successfully updated contact."
      redirect_to admin_manufacture_path(@manufacture)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @manufacture = Manufacture.find(params[:id])
    @manufacture.destroy if @manufacture.product.empty?
    
    redirect_to admin_manufactures_path
  end
  
  def add_new_language  
    respond_to do |format|
      format.js {render :partial => "add_new_language", :locals => { :lang_manufacture => LangManufacture.new }}
    end
  end

end
