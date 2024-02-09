require 'rails_helper'

RSpec.describe "supporting_documents/show", type: :view do
  let(:employer) { Employer.create!(name: "MyString") }
  let(:job_application) { JobApplication.create!(employer: employer) }

  before(:each) do
    assign(:supporting_document, SupportingDocument.create!(
      name: "Resume",
      document: Rack::Test::UploadedFile.new("spec/fixtures/files/resume.pdf", "application/pdf"),
      job_application: job_application
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Document/)
    expect(rendered).to match(/Job application/)
  end
end
