class HomeController < ApplicationController
 skip_before_filter :fix_refere_url
 
  def index
        
    session[:language] = 'pt-BR' if session[:language].nil?
    
    I18n.locale = session[:language]
    
    @languages = Language.all
    
    respond_to do |format|
      format.iphone do 
        render :layout => false if request.referrer != '/'
      end
    end
  end

  def render_index
    
   respond_to do |format|
      format.iphone { render :action => 'index' }
   end
    
  end
  
end