class Admin::CoversController < Admin::PublisherController
  
  layout "publisher_covers"
  
  def index

  end
  
  def new
    
    @cover = Cover.new
    
    @products  = Product.all_with_filter.active.with_images
    @solutions = Solution.all_with_filter
    
  end
  
  def show

    @cover = Cover.find params[:id]
    
    @products  = Product.all_with_filter.active.with_images
    @solutions = Solution.all_with_filter
    
  end
  
  def create
    cover_elements    = params[:cover_elements]
    cover_solution    = params[:cover_solution]
    cover_date_public = params[:cover_date_public]
    cover_status      = params[:cover_status]
    
    @solution = Solution.find cover_solution.to_i
    
    @cover             = Cover.new
    @cover.solution    = @solution
    @cover.public_date = cover_date_public
    @cover.status      = cover_status
    

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
  
  def update
    cover_id          = params[:id]
    cover_elements    = params[:cover_elements]
    cover_solution    = params[:cover_solution]
    cover_date_public = params[:cover_date_public]
    cover_status      = params[:cover_status]
    
    @solution = Solution.find cover_solution.to_i
    
    @cover             = Cover.find cover_id
    @cover.destroy
    
    @cover             = Cover.new
    
    @cover.id          = cover_id
    @cover.solution    = @solution
    @cover.public_date = cover_date_public
    @cover.status      = cover_status


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
