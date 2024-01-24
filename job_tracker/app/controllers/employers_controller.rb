class EmployersController < ApplicationController
  before_action :set_employer, only: %i[ show edit update destroy ]

  # GET /employers or /employers.json
  def index
    @employers = Employer.all
  end

  # GET /employers/1 or /employers/1.json
  def show
  end

  # GET /employers/new
  def new
    @employer_form = Employers::EmployerForm.new
  end

  # GET /employers/1/edit
  def edit
  end

  # POST /employers or /employers.json
  def create
    @employer_form = Employers::EmployerForm.new(params: employer_form_params)

    if @employer_form.call
      redirect_to employers_path, notice: "Employer was successfully created."
    else
      flash[:error] = @employer_form.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employers/1 or /employers/1.json
  def update
    respond_to do |format|
      if @employer.update(employer_params)
        format.html { redirect_to employer_url(@employer), notice: "Employer was successfully updated." }
        format.json { render :show, status: :ok, location: @employer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers/1 or /employers/1.json
  def destroy
    @employer.destroy!

    respond_to do |format|
      format.html { redirect_to employers_url, notice: "Employer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer
      @employer = Employer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employer_params
      params.require(:employer).permit(:name, :phone_number, :email, :address => [:street, :city, :state, :zip])
    end

    def employer_form_params
      params.require(:employers_employer_form).permit(:name, :phone_number, :email, :address => [:street, :city, :state, :zip])
    end
end
