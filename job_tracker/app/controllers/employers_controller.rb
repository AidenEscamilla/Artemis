class EmployersController < ApplicationController
  before_action :set_employer, only: %i[ show edit update destroy ]

  # GET /employers or /employers.json
  def index
    @employers = Employer.all.order(:name)
  end

  # GET /employers/1 or /employers/1.json
  def show
  end

  # GET /employers/new
  def new
    @employer = Employer.new
  end

  # GET /employers/1/edit
  def edit
    @employer_form
  end

  # POST /employers or /employers.json
  def create
    @employer = Employer.new(employer_params)

    if @employer.save
      redirect_to employers_path, notice: "Employer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /employers/1 or /employers/1.json
  def update    
    if @employer.update(employer_params)
      redirect_to employers_path, notice: "Employer was successfully created."
    else
      render :edit, status: :unprocessable_entity
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
    def set_employer
      @employer = Employer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def employer_params
      params.require(:employer).permit(:name, :phone_number, :email, :address => [:street, :city, :state, :zip])
    end
end
