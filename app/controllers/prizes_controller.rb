class PrizesController < ApplicationController
  def show
    @prize = Prize.find(params[:id])
    @product_prizes = Prize.by_product(1)#.by_language('en_US')
    
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
end
