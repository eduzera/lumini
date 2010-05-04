class PrizesController < ApplicationController
  def show
    @prize = Prize.by_language(session[:language]).find(params[:id])
    @product_prizes = Product.by_prize(params[:id]).active.by_language(session[:language])
    
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
end
