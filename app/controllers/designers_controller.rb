class DesignersController < ApplicationController
  def index
    @designer = Designer.by_product(params[:product_id]).by_language("ptBR").first
    
     respond_to do |format|
        format.iphone { render :layout => false }
      end
  end
end
