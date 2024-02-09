require 'rails_helper'

RSpec.describe SupportingDocument, type: :model do
  let(:employer) { create(:employer) }
  let(:job_application) { create(:job_application, employer: employer) }
  let(:supporting_document) { 
    create(:supporting_document, 
      job_application: job_application,
      name: "Resume",
      document: Rack::Test::UploadedFile.new("spec/fixtures/files/resume.pdf", "application/pdf")
    )
  }


  describe 'associations' do
    context 'belongs_to' do
      it "belongs to job_application" do
        expect(supporting_document.job_application).to eq(job_application)
      end
    end

    context 'has_one_attached' do
      it "has an attached document" do
        expect(supporting_document.document.attached?).to be_truthy
      end
    end
  end

  describe 'validations' do
    it "is valid with valid attributes" do
      expect(supporting_document).to be_valid
    end

    it "is not valid without a name" do
      supporting_document.name = nil
      expect(supporting_document).to_not be_valid
    end

    it "is not valid without a document" do
      supporting_document.document = nil
      expect(supporting_document).to_not be_valid
    end

    it "is not valid with a name that contains non-alphabetic characters" do
      supporting_document.name = "Resume123"
      expect(supporting_document).to_not be_valid
    end
  end
end
