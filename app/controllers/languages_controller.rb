class LanguagesController < ApplicationController
  def show
    @language = Language.find(params[:id])
   
    session[:language] = @language.abbr
    
    redirect_to request.referrer
  end
end
