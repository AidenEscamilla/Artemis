class SupportingDocument < ApplicationRecord
  belongs_to :job_application
  has_one_attached :document, dependent: :destroy

  validates :name, :document, presence: true
  validates :name, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }
end
