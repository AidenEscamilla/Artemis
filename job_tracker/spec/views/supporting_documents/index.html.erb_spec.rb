require 'rails_helper'

RSpec.describe "supporting_documents/index", type: :view do
  let(:employer) { create(:employer) }
  let(:job_application) { create(:job_application, employer: employer) }

  before do
    assign(:supporting_documents, [
      SupportingDocument.create!(
        name: "Resume",
        document: Rack::Test::UploadedFile.new("spec/fixtures/files/resume.pdf", "application/pdf"),
        job_application: job_application
      ),
      SupportingDocument.create!(
        name: "Cover letter",
        document: Rack::Test::UploadedFile.new("spec/fixtures/files/cover_letter.pdf", "application/pdf"),
        job_application: job_application
      )
    ])
  end

  it "renders a list of supporting_documents" do
    render
    
    assert_select "div>h2", text: Regexp.new("Name:\n*+".to_s), count: 2
    assert_select "div>p", text: Regexp.new("Job application:\n*+".to_s), count: 2
    assert_select "div>p", text: Regexp.new("Document:*+".to_s), count: 2
  end
end
