class HomeController < ApplicationController
 skip_before_filter :fix_refere_url
 
  def index
        
    session[:language] = 'pt-BR' if session[:language].nil?
    
    I18n.locale = session[:language]

    
    @languages = Language.all
    @cover = Cover.active.by_order
    @cover = @cover.by_date(@cover.first.public_date)
    
    @image = Image.by_imageable_type("Product").by_image_type("fotografia").by_cover.by_order
    
    @solution = Solution.all_with_filter.by_language(session[:language])
    unless @solution.empty?
       @solution = @solution.find(@cover.first.solution_id)
    else
      @solution=nil
    end
    
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