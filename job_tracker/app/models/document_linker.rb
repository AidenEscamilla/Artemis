class DocumentLinker < ApplicationRecord
  belongs_to :job_application
  belongs_to :supporting_document

  validates :job_application, :supporting_document, presence: true
end
