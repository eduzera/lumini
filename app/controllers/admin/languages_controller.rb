class Admin::LanguagesController < Admin::PublisherController
  
  layout "publisher_others"
  
  def index

  end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(params[:language])
    if @language.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_language_url(@language)
    else
      render :action => 'new'
    end
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    if @language.update_attributes(params[:language])
      flash[:notice] = "Successfully updated contact."
      redirect_to admin_language_url(@language)
    else
      render :action => 'edit'
    end
  end

  def show
    @language = Language.find(params[:id])
  end

  def destroy
    @language = Language.find(params[:id])
    
    @language.destroy
    
    redirect_to admin_languages_path
  end

end
