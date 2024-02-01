class JobApplicationsController < ApplicationController
  before_action :set_job_application, only: %i[ show edit update destroy ]

  # GET /job_applications or /job_applications.json
  def index
    @job_applications = JobApplication.all
  end

  # GET /job_applications/1 or /job_applications/1.json
  def show
  end

  # GET /job_applications/new
  def new
    @job_application = JobApplication.new
    @job_application.build_job_description
  end

  # GET /job_applications/1/edit
  def edit
  end

  # POST /job_applications or /job_applications.json
  def create
    @job_application = JobApplication.new(job_application_params)

    if @job_application.save
      redirect_to job_applications_path, notice: "Job application was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /job_applications/1 or /job_applications/1.json
  def update
    if @job_application.update(job_application_params)
      redirect_to job_applications_path, notice: "Job application was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /job_applications/1 or /job_applications/1.json
  def destroy
    @job_application.destroy!

    respond_to do |format|
      format.html { redirect_to job_applications_url, notice: "Job application was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_application
      @job_application = JobApplication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_application_params
      params
        .require(:job_application)
        .permit(:id, :job_title, :employer_id, :status,
                job_description_attributes: %i[description requirements min_salary max_salary job_classification]
        )
    end
end
