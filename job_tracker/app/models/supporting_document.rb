class SupportingDocument < ApplicationRecord
  has_many :document_linkers, dependent: :destroy
  has_many :job_applications, :through => :document_linkers

  has_one_attached :document, dependent: :destroy


  validates :name, :document, presence: true
  validates :name, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" }
end
