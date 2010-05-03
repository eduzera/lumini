class Admin::PrizesController < ApplicationController
  layout "publisher_prizes"
  
  def index
    @prizes = Prize.all
  end
  
  def new
    @prize = Prize.new
    @prize.lang_prize.build
  end
  
  def create
    @prize = Prize.new(params[:prize])
    @prize.images.build
    if @prize.save
      flash[:notice] = "Successfully created contact."
      redirect_to admin_prize_url(@prize)
    else
      redirect_to :back
    end
  end
  
  def edit
    @prize = Prize.find(params[:id])
  end
  
  def update
    @prize = Prize.find(params[:id])
    if @prize.update_attributes(params[:prize])
      flash[:notice] = "Successfully updated contact."
      redirect_to admin_prize_path(@prize)
    else
      redirect_to :back
    end
  end
  
  def show
    @prize = Prize.find(params[:id])
  end
  
  def destroy
    @prize = Prize.find(params[:id])
    @prize.destroy
    
    redirect_to admin_prizes_path
  end
  
  def add_new_language    
    
    respond_to do |format|
      format.js {render :partial => "add_new_language", :locals => { :lang_prize => LangPrize.new }}
    end
  end
end
