class StoresController < ApplicationController
  def index
    @stores = Store.active
    
    respond_to do |format|
      format.iphone {render :layout => false}
    end
  end
end
