class FamiliesController < ApplicationController
  def show
    #@families = Family.product_by_family_and_category(params[:id])
        
    @families = Family.all_with_filter(params[:id], session[:language])
    @category = Category.info(params[:id]).first
    @products = Product.by_category(@category.id).by_language(session[:language])

    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
end
