class JobDescription < ApplicationRecord
  belongs_to :job_application
  
  validates   :description, :requirements, :job_classification,
    :min_salary, :max_salary, presence: true

  validates :job_classification, 
    format: { with: /\A[a-zA-Z\s]+\z/ },  unless: -> { job_classification.blank? }

  validates :min_salary, :max_salary, format: { with: /\A\d+\z/ }
  validate :min_salary_less_than_max_salary

  private
  
  def min_salary_less_than_max_salary
    return unless min_salary.present? && max_salary.present?

    if min_salary > max_salary
      errors.add(:min_salary, 'must be less than max salary')
    end
  end

end
