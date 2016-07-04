class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.find_by_matricula(params[:matricula])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_url, alert: "Matrícula ou Senha inválidos."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
