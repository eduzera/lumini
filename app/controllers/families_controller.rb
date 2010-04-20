class FamiliesController < ApplicationController
  def show
    #@families = Family.product_by_family_and_category(params[:id])
        
    @families = Family.all_with_filter
    @category = Category.info(params[:id]).first
    @products = Product.by_category(@category.id)

    respond_to do |format|
      format.iphone { render :layout => false }
      #format.js
    end
  end
end
