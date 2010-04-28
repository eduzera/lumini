# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  #acts_as_iphone_controller
  #:inherit_resources
  
   before_filter :fix_refere_url

   def fix_refere_url
     if request.request_uri.count('/') > 2
       session[:back_to_parent] = request.request_uri[0, request.request_uri.index('/', 1+ (request.request_uri.index('/', +1)))] if request.request_uri 
     end
   end
end
