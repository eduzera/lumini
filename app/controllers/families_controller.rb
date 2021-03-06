class FamiliesController < ApplicationController
  def show
    #@families = Family.product_by_family_and_category(params[:id])
        
    @families = Family.by_category(params[:id], session[:language])
    #@category = Category.info(params[:id]).first
    @category = Category.active(session[:language]).find(params[:id])
    @products = Product.by_category(@category).by_language(session[:language])

    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
end
