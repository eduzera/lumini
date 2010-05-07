class Admin::PrizesController < Admin::PublisherController
  layout "publisher_prizes"
  
  before_filter :put_last_controller_on_session
  
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
      render :action => 'new'
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
      render :action => 'edit'
    end
  end
  
  def show
    @prize = Prize.find(params[:id])
  end
  
  def destroy
    @prize = Prize.find(params[:id])
    @prize.destroy if @prize.product_prize.empty?
    
    redirect_to admin_prizes_path
  end
  
  def add_new_language    
    
    respond_to do |format|
      format.js {render :partial => "add_new_language", :locals => { :lang_prize => LangPrize.new }}
    end
  end
  
  def put_last_controller_on_session 
        session[:last_controller] = self.controller_name
  end
  
end
