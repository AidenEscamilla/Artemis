class JobDescriptions::JobDescriptionForm
  include ActiveModel::Model

  attr_accessor :job_description, :description, :requirements, 
    :job_classification, :min_salary, :max_salary, :job_application_id
    

  def initialize(job_description:)
    @job_description = job_description
    @job_application_id = job_description.job_application_id
    @description = job_description.description
    @requirements = job_description.requirements
    @job_classification = job_description.job_classification
    @min_salary = job_description.min_salary
    @max_salary = job_description.max_salary
  end

  def save!
    if valid?
      job_description.save!
    else
      job_description.errors.copy!(self.errors)
      false
    end
  end

  def update!(job_description_params)
    job_description.attributes = job_description_params #TODO: figure out how to set attributes
    if job_description.valid?
      job_description.update!(job_description_params)
    else
      false
    end
  end
end