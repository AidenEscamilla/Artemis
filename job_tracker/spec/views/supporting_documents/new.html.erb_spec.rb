require 'rails_helper'

RSpec.describe "supporting_documents/new", type: :view do
  let(:employer) { create(:employer) }
  let(:job_application) { create(:job_application, employer: employer) }
  let(:supporting_document) {SupportingDocument.create!(
      name: "Resume",
      document: Rack::Test::UploadedFile.new("spec/fixtures/files/resume.pdf", "application/pdf")
    )}

  before do
    assign(:supporting_document, supporting_document)
  end

  it "renders new supporting_document form" do
    render

    assert_select "form[action=?][method=?]", "#{supporting_documents_path}/#{supporting_document.id}", "post" do

      assert_select "input[name=?]", "supporting_document[name]"

      assert_select "input[name=?]", "supporting_document[document]"

      assert_select "input[name=?]", "supporting_document[job_application_ids][]"
    end

  end
end
