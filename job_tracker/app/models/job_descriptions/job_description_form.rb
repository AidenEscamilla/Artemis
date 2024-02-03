class JobDescriptions::JobDescriptionForm
  include ActiveModel::Model

  attr_accessor :job_description, :description, :requirements, 
    :job_classification, :min_salary, :max_salary, :job_application_id
  
  validates :job_description, :description, :requirements, 
    :job_classification, :min_salary, :max_salary, :job_application_id, presence: true
  
    validates :job_classification, 
    format: { with: /\A[a-zA-Z\s]+\z/ },  unless: -> { job_classification.blank? }

  validates :min_salary, :max_salary, format: { with: /\A\d+\z/ }
  validate :min_salary_less_than_max_salary


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
    self.attributes = job_description_params #TODO: figure out how to set attributes
    if valid?
      job_description.update!(job_description_params)
    else
      job_description.errors.copy!(self.errors)
      false
    end
  end

  private

  def min_salary_less_than_max_salary
    return unless min_salary.present? && max_salary.present?

    if min_salary > max_salary
      errors.add(:min_salary, 'must be less than max salary')
    end
  end
end