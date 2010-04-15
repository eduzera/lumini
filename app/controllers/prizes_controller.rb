class PrizesController < ApplicationController
  def index
    @prizes = Prize.all
  end
  
  def show
    @prize = Prize.find(params[:id])
  end
  
  def new
    @prize = Prize.new
  end
  
  def create
    @prize = Prize.new(params[:prize])
    if @prize.save
      flash[:notice] = "Successfully created prize."
      redirect_to @prize
    else
      render :action => 'new'
    end
  end
  
  def edit
    @prize = Prize.find(params[:id])
  end
  
  def update
    @prize = Prize.find(params[:id])
    if @prize.update_attributes(params[:prize])
      flash[:notice] = "Successfully updated prize."
      redirect_to @prize
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @prize = Prize.find(params[:id])
    @prize.destroy
    flash[:notice] = "Successfully destroyed prize."
    redirect_to prizes_url
  end
end
