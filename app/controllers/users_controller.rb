class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :usuario_not_operador, :only => [:destroy]
  before_action :proprio_usuario, :only => [:update, :edit]
  before_action :usuario_comum


  # GET /users
  # GET /users.json
  def index
    @users = User.all.paginate(page: params[:page], per_page: 30)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.password == nil and not @user.admin
      @user.password = 'w5eDtYwg1pxg'
      @user.password_confirmation = 'w5eDtYwg1pxg'
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Usuário criado.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path, notice: 'Usuário editado.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    begin
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'Usuário apagado.' }
        format.json { head :no_content }
      end
    rescue
      redirect_to users_url, notice: 'Ação interrompida - Este usuário possui dependências.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:nome, :matricula, :servidor, :admin, :password, :password_confirmation)
    end

    def proprio_usuario
      if @user != @user_logado and not @user_logado.admin
        redirect_to users_url, notice: 'Você não permissão para isso.'
      end
    end
end
