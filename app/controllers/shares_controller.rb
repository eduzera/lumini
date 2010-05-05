class SharesController < ApplicationController
  def show
    @share = Product.find(params[:id])
    
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
end
