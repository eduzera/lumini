class Admin::ImagesController < ApplicationController
  layout "admin"
  
  before_filter :find_parent
  
  def show
    @image = @klass.find(params[:id]).images.new
    @images = Image.all_with_filter(params[:imageable_type].capitalize, params[:type]) #conditions tira o to_a
    @types = ImageType.all_with_filter(@klass.name.capitalize)
  end
  
   def create
      @image = Image.create(params[:image])
      respond_to do |format|
        format.html { redirect_to :back }
      end
    end

  private

  def find_parent
    @klass = params[:imageable_type]
    @klass = params[:image][:imageable_type] if @klass.nil?
    @klass = @klass.capitalize.constantize
  end
end
