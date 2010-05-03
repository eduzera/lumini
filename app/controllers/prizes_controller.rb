class PrizesController < ApplicationController
  def show
    @prize = Prize.find(params[:id])
    @product_prizes = Product.by_prize(params[:id]).active #.by_language('en_US')
    
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
end
