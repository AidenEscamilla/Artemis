class SupportingDocument < ApplicationRecord
  belongs_to :job_application
  has_one_attached :document, dependent: :destroy
end
