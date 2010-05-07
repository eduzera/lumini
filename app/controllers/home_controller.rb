class HomeController < ApplicationController
 skip_before_filter :fix_refere_url
 
  def index
    session[:language] = 'pt-BR' if session[:language].nil?
    
    @languages = Language.all
    @cover = Cover.active.by_order
    @cover = @cover.by_date(@cover.first.public_date) unless @cover.empty?
    
    @image = Image.by_imageable_type("Product").by_image_type("fotografia").by_cover.by_order
    
    @solution = Solution.all_with_filter.by_language(session[:language])
    @solution = @solution.find(@cover.first.solution_id) unless @solution.empty? unless @cover.empty?
    @solution = nil if @cover.empty?
    
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