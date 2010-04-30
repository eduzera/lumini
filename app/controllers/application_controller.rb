# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  #acts_as_iphone_controller
  #:inherit_resources
  
   before_filter :fix_refere_url  

  def fix_refere_url
    var = request.request_uri

    if var.split('/').length > 3
      if var.split('/')[2].to_i != 0
        session[:back_to_parent] = var.split('/')[0..2].join('/')
      end
    end
  end
end
