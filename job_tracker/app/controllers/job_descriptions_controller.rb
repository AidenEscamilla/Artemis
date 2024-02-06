class JobDescriptionsController < ApplicationController
  before_action :set_job_description, only: %i[ show edit update]

  # GET /job_descriptions or /job_descriptions.json
  def index
    @job_descriptions = JobDescription.all
  end

  # GET /job_descriptions/1 or /job_descriptions/1.json
  def show
  end

  # GET /job_descriptions/new
  def new
    @job_description = JobDescription.new
  end

  # GET /job_descriptions/1/edit
  def edit
  end

  # POST /job_descriptions or /job_descriptions.json
  def create
    @job_description = JobDescription.new(job_description_params)

    respond_to do |format|
      if current_form.save!
        format.html { redirect_to job_description_url(@job_description), notice: "Job description was successfully created." }
        format.json { render :show, status: :created, location: @job_description }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_descriptions/1 or /job_descriptions/1.json
  def update
    respond_to do |format|
      if current_form.update!(job_description_params)
        format.html { redirect_to job_description_url(@job_description), notice: "Job description was successfully updated." }
        format.json { render :show, status: :ok, location: @job_description }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job_description.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_description
      @job_description = JobDescription.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_description_params
      params.require(:job_description).permit(:description, :requirements, :job_classification, :min_salary, :max_salary, :job_application_id)
    end

    def current_form
      @current_form ||= JobDescriptions::JobDescriptionForm.new(job_description:)
    end

    def job_description
      @job_description ||= JobDescription.new
    end
end
