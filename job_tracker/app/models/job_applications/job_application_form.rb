class JobApplications::JobApplicationForm
  include ActiveModel::Model

  attr_accessor :job_application, :employer_id, :job_title, :status, :job_description

  validates   :employer_id, :job_title, :status,
    :job_description, presence: true


  validates :job_title, 
    format: { with: /\A[a-zA-Z\s\d]+\z/ },  unless: -> { job_title.blank? }
    

  def initialize(job_application:)
    @job_application = job_application
    @employer_id = job_application.employer_id
    @job_title = job_application.job_title
    @status = job_application.status
    @job_description = job_application.job_description
  end

  def save!
    if job_description_form.valid? && valid?
      job_application.save!
    else
      job_application.errors.merge!(errors)
      job_application.errors.merge!(job_description_form.errors)
      false
    end
  end

  def update!(job_application_params:)
    @employer_id = job_application_params[:employer_id]
    @job_title = job_application_params[:job_title]
    @status = job_application_params[:status]
    @job_description.update(job_application_params[:job_description_attributes])

    if job_description_form.valid? && valid?
      job_application.update!(job_application_params) # be aware of SQL injection here
    else
      job_application.errors.merge!(errors)
      job_application.errors.merge!(job_description_form.errors)
      false
    end
  end

  private

  def job_description_form
    @job_description_form ||= JobDescriptions::JobDescriptionForm.new(job_description: @job_description)
  end
  
  def min_salary_less_than_max_salary
    return unless min_salary.present? && max_salary.present?

    if min_salary > max_salary
      errors.add(:min_salary, 'must be less than max salary')
    end
  end

  def valid_job_description?
    return unless job_description.present?
    
    unless job_description.valid?
      job_description.errors.each do |attribute, message|
        errors.add(attribute, message)
      end
    end

    true
  end

end