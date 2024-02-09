class JobApplication < ApplicationRecord
  belongs_to :employer
  has_one :job_description, dependent: :delete
  has_many :supporting_documents, dependent: :delete_all
  
  accepts_nested_attributes_for :job_description, update_only: true

  enum status: %i[applied rejected interview_scheduled second_round waiting_decision offered_job hired].index_with(&:to_s)

end
