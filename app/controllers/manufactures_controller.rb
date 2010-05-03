class ManufacturesController < ApplicationController
  def index
    @manufactures = Manufacture.active(session[:language])
     respond_to do |format|
        format.iphone {render :layout => false}
      end
  end
  
  def show
    #@families = Family.product_by_family_and_manufacture(params[:id])
    @families = Family.all_with_filter(params[:id], session[:language])

     respond_to do |format|
        format.iphone {render :layout => false}
      end
  end
end
