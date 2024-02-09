require 'rails_helper'

RSpec.describe "supporting_documents/new", type: :view do
  let(:employer) { create(:employer) }
  let(:job_application) { create(:job_application, employer: employer) }

  before do
    assign(:supporting_document, SupportingDocument.new(
      name: "Resume",
      document: Rack::Test::UploadedFile.new("spec/fixtures/files/resume.pdf", "application/pdf"),
      job_application: job_application
    ))
  end

  it "renders new supporting_document form" do
    render

    assert_select "form[action=?][method=?]", supporting_documents_path, "post" do

      assert_select "input[name=?]", "supporting_document[name]"

      assert_select "input[name=?]", "supporting_document[document]"

      assert_select "select[name=?]", "supporting_document[job_application_id]"
    end
  end
end
