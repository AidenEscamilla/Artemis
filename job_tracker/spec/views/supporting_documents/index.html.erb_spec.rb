require 'rails_helper'

RSpec.describe "supporting_documents/index", type: :view do
  let(:employer) { create(:employer) }
  let(:job_application) { create(:job_application, employer: employer) }
  let(:supporting_document1) { SupportingDocument.create!(
      name: "Resume",
      document: Rack::Test::UploadedFile.new("spec/fixtures/files/resume.pdf", "application/pdf")
    )}

  let(:supporting_document2) { SupportingDocument.create!(
      name: "Cover letter",
      document: Rack::Test::UploadedFile.new("spec/fixtures/files/cover_letter.pdf", "application/pdf")
    )}
  
  before do
    assign(:supporting_documents, [supporting_document1, supporting_document2])
  end

  it "renders a list of supporting_documents" do
    render
    
    assert_select "div>h2", text: Regexp.new("Name:\n*+".to_s), count: 2
    assert_select "div>p", text: Regexp.new("Job applications:\n*+".to_s), count: 2
    assert_select "div>p", text: Regexp.new("Document:*+".to_s), count: 2
  end
end
