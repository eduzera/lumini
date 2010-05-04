class ManufacturesController < ApplicationController
  def index
    @manufactures = Manufacture.active(session[:language])
    
     respond_to do |format|
        format.iphone {render :layout => false}
      end
  end
  
  def show
    #@families = Family.product_by_family_and_manufacture(params[:id])
    @families = Family.by_manufacture(params[:id], session[:language])
    @products = Product.by_manufacture(@families.first.product_manufacture_id).by_language(session[:language])
    
     respond_to do |format|
        format.iphone {render :layout => false}
      end
  end
end
