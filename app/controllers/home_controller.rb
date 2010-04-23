class HomeController < ApplicationController
 skip_before_filter :fix_refere_url
 
  def index
    respond_to do |format|
      format.iphone
    end
  end
end