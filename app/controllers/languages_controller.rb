class LanguagesController < ApplicationController
  def show
    session[:language] = Language.find(params[:id]).abbr
    redirect_to categories_path
  end
end
