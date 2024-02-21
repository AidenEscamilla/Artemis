require 'rails_helper'

RSpec.describe SupportingDocument, type: :model do
  let(:employer) { create(:employer) }
  let(:job_application) { create(:job_application, employer: employer) }
  let(:supporting_document) { 
    create(:supporting_document, 
      name: "Resume",
      document: Rack::Test::UploadedFile.new("spec/fixtures/files/resume.pdf", "application/pdf")
    )
  }
  let!(:document_linker) {create(:document_linker, job_application:, supporting_document:)}


  describe 'associations' do
    context 'has_many' do
      it "has a document_linker" do
        expect(supporting_document.document_linkers.first).to_not be_nil
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
