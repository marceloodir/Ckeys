class AuthorizationsController < ApplicationController
  skip_before_filter :authorize, only: [:index]
  before_action :usuario_comum
  before_action :set_authorization, only: [:show, :edit, :update, :destroy]

  # GET /authorizations
  # GET /authorizations.json
  def index
    @authorizations = Authorization.all
  end

  # GET /authorizations/1
  # GET /authorizations/1.json
  def show
  end

  # GET /authorizations/new
  def new
    @authorization = Authorization.new
  end

  # GET /authorizations/1/edit
  def edit
  end

  # POST /authorizations
  # POST /authorizations.json
  def create
    @authorization = Authorization.new(authorization_params)
    @authorization.date_register = Date.today

    respond_to do |format|
      if @authorization.save
        format.html { redirect_to authorizations_path, notice: 'Autorização criada.' }
        format.json { render :show, status: :created, location: @authorization }
      else
        format.html { render :new }
        format.json { render json: @authorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authorizations/1
  # PATCH/PUT /authorizations/1.json
  def update
    respond_to do |format|
      if @authorization.update(authorization_params)
        format.html { redirect_to authorizations_path, notice: 'Autorização editada.' }
        format.json { render :show, status: :ok, location: @authorization }
      else
        format.html { render :edit }
        format.json { render json: @authorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authorizations/1
  # DELETE /authorizations/1.json
  def destroy
    @authorization.destroy
    respond_to do |format|
      format.html { redirect_to authorizations_url, notice: 'Autorização apagada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authorization
      @authorization = Authorization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def authorization_params
      params.require(:authorization).permit(:user_id, :authorizer_id, :room_id, :date_register, :date_expiration)
    end
end
