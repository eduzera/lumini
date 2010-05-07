class Admin::FamiliesController < Admin::PublisherController
  
  layout "publisher_products"
  
  def index
  end

  def new
    @family = Family.new
    @family.lang_family.build
  end

  def edit
    @family = Family.find(params[:id])
  end

  def create
    @family = Family.new(params[:family])
    if @family.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_family_url(@family)
    else
      render :action => 'new'
    end
  end

  def update
    @family = Family.find(params[:id])
    if @family.update_attributes(params[:family])
      flash[:notice] = "Successfully updated contact."
      redirect_to admin_family_path(@family)
    else
      render :action => 'edit'
    end
  end

  def show
    @family = Family.find(params[:id])
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy if @family.product.empty?
    
    redirect_to admin_families_path
  end
  
  def add_new_language
    respond_to do |format|
      format.js {render :partial => "add_new_language", :locals => { :lang_family => LangFamily.new }}
    end
  end

end
