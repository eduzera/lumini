class Admin::CategoriesController < ApplicationController
  
  layout "publisher_products"
  
  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
    @category.lang_category.build
  end
  
  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_category_url(@category)
    else
#      redirect_to :back
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = "Successfully updated contact."
      redirect_to admin_category_path(@category)
    else
#      redirect_to :back
    end
  end
  
  def show
    @category = Category.find(params[:id])
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    
    redirect_to admin_categories_path
  end
  
  def add_new_language
    respond_to do |format|
      format.js {render :partial => "add_new_language", :locals => { :lang_category => LangCategory.new }}
    end
  end
  
end
