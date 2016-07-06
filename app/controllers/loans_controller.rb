class LoansController < ApplicationController
  skip_before_filter :authorize, only: [:index]
  before_action :set_loan, only: [:show, :edit, :update, :destroy, :devolver]
  before_action :permited_loan, only: [:create, :update]

  # GET /loans
  # GET /loans.json
  def index
    @loans = Loan.all
    @loans_inativos = Loan.inativos.paginate(page: params[:page], per_page: 30)
  end

  # GET /loans/1
  # GET /loans/1.json
  def show
  end

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # GET /loans/1/edit
  def edit
  end

  # POST /loans
  # POST /loans.json
  def create
    @loan = Loan.new(loan_params)
    @loan.input_register = DateTime.now

    respond_to do |format|
      if @loan.save
        format.html { redirect_to loans_path, notice: 'Empréstimo cadastrado.' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /loans/1
  # PATCH/PUT /loans/1.json
  def update
    respond_to do |format|
      if @loan.update(loan_params)
        format.html { redirect_to loans_path, notice: 'Empréstimo editado.' }
        format.json { render :show, status: :ok, location: @loan }
      else
        format.html { render :edit }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /loans/1
  # DELETE /loans/1.json
  def destroy
    @loan.destroy
    respond_to do |format|
      format.html { redirect_to loans_url, notice: 'Empréstimo apagado.' }
      format.json { head :no_content }
    end
  end

  def devolver
    @loan.output_register = DateTime.now
    @loan.save
    redirect_to loans_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def loan_params
      params.require(:loan).permit(:user_id, :room_id, :input_register, :output_register)
    end

    def permited_loan
      loan = Loan.new(loan_params)
      if User.alunos.include? loan.user #verifica se tem autorização somente para alunos
        unless Authorization.ativos.exists?(user_id: loan.user_id, room_id: loan.room_id)
          redirect_to loans_path, notice: 'Usuário não tem permissão para acesso a esse laboratório'
        end
      end
    end
end
