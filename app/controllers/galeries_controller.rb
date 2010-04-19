class GaleriesController < ApplicationController
  def index
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
  
  def show
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end

end
