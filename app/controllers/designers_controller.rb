class DesignersController < ApplicationController
  def show
    @designer = Designer.by_product(params[:id]).by_language("ptBR").first
    
     respond_to do |format|
        format.iphone { render :layout => false }
      end
  end
end
