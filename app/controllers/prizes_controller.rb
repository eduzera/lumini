class PrizesController < ApplicationController
  def show
    @prize = Prize.find(params[:id])
    
    respond_to do |format|
      format.iphone { render :layout => false }
    end
  end
end
