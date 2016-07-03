class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authorize, :qual_usuario

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Por favor faça login"
    end
  end

  def qual_usuario
    @user_logado = User.find_by_id(session[:user_id])
  end

  def usuario_comum
    if not @user_logado.servidor and not @user_logado.admin
      redirect_to loans_url, notice: 'Você não tem permissão para essa ação.'
    end
  end

  def usuario_not_operador
    unless @user_logado.admin
      redirect_to loans_url, notice: 'Você não tem permissão para essa ação.'
    end
  end

end
