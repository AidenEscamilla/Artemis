require 'rails_helper'

RSpec.describe "supporting_documents/edit", type: :view do
  let(:employer) { Employer.create!(name: "Employer") }
  let(:job_application) {create(:job_application, employer: employer)}

  let(:supporting_document) {
    SupportingDocument.create!(
      name: "Resume",
      document: Rack::Test::UploadedFile.new("spec/fixtures/files/resume.pdf", "application/pdf"),
      job_application: job_application
    )
  }

  before(:each) do
    assign(:supporting_document, supporting_document)
  end

  it "renders the edit supporting_document form" do
    render

    assert_select "form[action=?][method=?]", supporting_document_path(supporting_document), "post" do

      assert_select "input[name=?]", "supporting_document[name]"

      assert_select "input[name=?]", "supporting_document[document]"

      assert_select "select[name=?]", "supporting_document[job_application_id]"
    end
  end
end
