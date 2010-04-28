class Admin::DesignersController < ApplicationController
  
  layout "admin"
  
  def index
    @designers = Designer.all
  end
  
  def new
    @designer = Designer.new
  end
  
  def create
    @designer = Designer.new(params[:designer])
    if @designer.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_designer_url(@designer)
    else
      redirect_to :back
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
      redirect_to :back
    end
  end
  
  def show
    @designer = Designer.find(params[:id])
  end
  
  def destroy
    @designer = Designer.find(params[:id])
    @designer.destroy
    
    redirect_to admin_designers_path
  end
  
end
