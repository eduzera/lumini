class Admin::StoresController < Admin::PublisherController
  
  layout "publisher_stores"
  
  def index
    @store = Store.all
  end
  
  def new
    @store = Store.new
    @store.lang_store.build
  end
  
  def create
    @store = Store.new(params[:store])
    if @store.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_store_url(@store)
    else
      render :action => 'new'
    end
  end
  
  def update
    @store = Store.find(params[:id])
    if @store.update_attributes(params[:store])
      flash[:notice] = "Successfully updated contact."
      redirect_to admin_store_path(@store)
    else
      render :action => 'edit'
    end
  end
  
  def edit
    @store = Store.find(params[:id])
  end
  
  def show
    @store = Store.find(params[:id])
  end
  
  def destroy
    @store = Store.find(params[:id])
    @store.destroy
    
    redirect_to admin_stores_path
  end
  
  def add_new_language     
    respond_to do |format|
      format.js {render :partial => "add_new_language", :locals => { :lang_store => LangStore.new }}
    end
  end
  
  
end
