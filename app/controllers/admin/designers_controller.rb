class Admin::DesignersController < Admin::PublisherController
  
  layout "publisher_designers"
  
  before_filter :put_last_controller_on_session
  
  def index
    @designers = Designer.all
  end
  
  def new
    @designer = Designer.new
    @designer.lang_designer.build
    @designer.images.build
  end
  
  def create
    @designer = Designer.new(params[:designer])
    @designer.images.build
    
    if @designer.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_designer_url(@designer)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @designer = Designer.find(params[:id])
  end
  
  def update
    @designer = Designer.find(params[:id])
    if @designer.update_attributes(params[:designer])
      flash[:notice] = "Successfully updated contact."
      redirect_to admin_designer_url(@designer)
    else
      render :action => 'edit'
    end
  end
  
  def show
    @designer = Designer.find(params[:id])
  end
  
  def destroy
    @designer = Designer.find(params[:id])
    @designer.destroy if @designer.product.empty?
    
    redirect_to admin_designers_path
  end
  
  def add_new_language
    respond_to do |format|
      format.js {render :partial => "add_new_language", :locals => { :lang_designer => LangDesigner.new }}
    end
  end
  
  def put_last_controller_on_session 
        session[:last_controller] = self.controller_name
  end
  
end
