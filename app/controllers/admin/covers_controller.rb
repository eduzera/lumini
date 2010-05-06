class Admin::CoversController < ApplicationController
  
  layout "publisher_covers"
  
  def index
    @products  = Product.all_with_filter.active
    @solutions = Solution.all_with_filter
  end
  
  def create
    
    #Cover.destroy_all
    
    cover_elements = params[:cover_elements]
    cover_solution = params[:cover_solution]
    
    @solution = Solution.find cover_solution.to_i
    
    @cover = Cover.new
    @cover.solution = @solutions
    

    for i in 0...cover_elements.length
      
      elements = cover_elements[i].split(',')
      
      @product = Product.find elements[0].to_i
      
      @cover.cover_element.build(:grid_size => elements[1], :priority => i)
      
      @cover.cover_element.last.product = @product
      
    end
    
    if @cover.save
      render :text => 'ok'
    else
      render :text => 'error'
    end
    
  end
  
  
  
  
  def product_image
    product    = params[:product_id]
    image_grid = params[:grid]
    
    image =  Image.by_imageable_id(product).by_imageable_type('Product').by_cover
    image_url =  image.first.img.url(image_grid)
    
    render :text => image_url
    
  end

end
