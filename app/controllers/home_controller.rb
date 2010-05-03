class HomeController < ApplicationController
 skip_before_filter :fix_refere_url
 
  def index
    session[:language] = 'pt_BR' if session[:language].nil?
    @languages = Language.all
    
    respond_to do |format|
      format.iphone
    end
  end
end