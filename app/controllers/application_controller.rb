# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  #acts_as_iphone_controller
  #:inherit_resources
  
   after_filter :fix_refere_url  
   before_filter :set_locale
  
  def fix_refere_url
    var = request.request_uri

    if var.split('/').length > 2
      if var.split('/')[2].to_i != 0 && var.split('/')[1] != 'galery'
        session[:back_to_parent] = request.request_uri
      end
    end
  end
  
  def set_locale    
    if session[:language].nil?
      I18n.locale = 'pt-BR'
    else
      I18n.locale = session[:language]
    end
  end
  
end
