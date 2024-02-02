class JobApplication < ApplicationRecord
  belongs_to :employer
  has_one :job_description, dependent: :delete, required: true
  
  accepts_nested_attributes_for :job_description, update_only: true

  validates_associated :job_description


  enum status: %i[applied rejected interview_scheduled second_round waiting_decision offered_job hired].index_with(&:to_s)

end
