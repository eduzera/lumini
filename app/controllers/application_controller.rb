# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  :acts_as_iphone_controller
  #:inherit_resources

  before_filter :mobile 

  private
    def mobile
     # if request.user_agent =~ /Mobile|webOS/
     #  request.format = :iphone
     # else
     # # redirect_to "http://www.lumini.com.br"
     #  request.format = :html
     #end
     #request.format = :iphone
    end
end
