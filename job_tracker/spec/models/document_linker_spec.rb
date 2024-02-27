require 'rails_helper'

RSpec.describe DocumentLinker, type: :model do
  let(:employer) { create(:employer) }
  let(:job_application){ create(:job_application, employer:) }
  let(:supporting_document) { 
    create(:supporting_document, 
      name: "Resume",
      document: ActiveStorage::Blob.create_and_upload!(
        io: File.open(Rails.root.join(file_fixture("resume.pdf")), 'rb'),
        filename: "resume.pdf",
        content_type: 'application/pdf'
      )
    )
  }

  describe 'validations' do
    context "when attributes are valid" do
      let(:document_linker) { create(:document_linker, job_application:, supporting_document:) }
      it "is a valid model" do
        expect(document_linker).to be_valid
      end

      it "saves the model" do
        expect(document_linker.save!).to be_truthy
      end
    end

    context "when job application is nil" do
      let(:document_linker) { DocumentLinker.new(job_application: nil, supporting_document:) }
      it "is an invalid model" do
        expect(document_linker).to_not be_valid
      end
    end

    context "when supporting document is nil" do
      let(:document_linker) { DocumentLinker.new(job_application:, supporting_document: nil) }
      it "is an invalid model" do
        expect(document_linker).to_not be_valid
      end
    end
  end


end
