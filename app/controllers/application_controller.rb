# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  #acts_as_iphone_controller
  #:inherit_resources
  
   after_filter :fix_refere_url  
   before_filter :set_locale
   
   #Authlogic
   filter_parameter_logging :password
   helper_method :current_user
  
  #autorizacao
  rescue_from 'Acl9::AccessDenied', :with => :access_denied

  def access_denied
    if current_user
      render :template => 'static_content/denied'
    else
      flash[:notice] = 'Acesso negado. Você precisa estar logado.'
      redirect_to login_path
    end
  end
  
  #marco filtro
  def fix_refere_url
    var = request.request_uri

    if var.split('/').length > 2
      if var.split('/')[2].to_i != 0 && var.split('/')[1] != 'galery'
        session[:back_to_parent] = request.request_uri
      end
    end
  end
  
  #internacionalizacao
  def set_locale    
    if session[:language].nil?
      I18n.locale = 'pt-BR'
    else
      I18n.locale = session[:language]
    end
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  
end
