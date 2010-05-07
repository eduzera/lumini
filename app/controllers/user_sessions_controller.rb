class UserSessionsController < ApplicationController
  
  layout 'user_session'

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Usuário logado com sucesso."
      redirect_to admin_url
    else
      flash[:notice] = "Usuario e senha incorretos."
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Sessão finalizada com sucesso."
    redirect_to login_url
  end


end