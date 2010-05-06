class HomeController < ApplicationController
 skip_before_filter :fix_refere_url
 
  def index
    session[:language] = 'pt_BR' if session[:language].nil?
    @languages = Language.all
    @cover = Cover.active
    @image = Image.by_imageable_type("Product").by_image_type("fotografia").by_cover.by_order
    
    respond_to do |format|
      format.iphone
    end
  end
end