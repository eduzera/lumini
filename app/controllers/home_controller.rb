class HomeController < ApplicationController
 skip_before_filter :fix_refere_url
 
  def index
    session[:language] = 'pt_BR' if session[:language].nil?
    
    @languages = Language.all
    @cover = Cover.active
    @image = Image.by_imageable_type("Product").by_image_type("fotografia").by_cover.by_order
    
    @solution = Solution.all_with_filter.by_language(session[:language])
    unless @solution.empty?
       @solution = @solution.find(@cover.first.solution_id)
    else
      @solution=nil
    end
    
    respond_to do |format|
      format.iphone
    end
  end
end