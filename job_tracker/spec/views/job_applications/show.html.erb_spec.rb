require 'rails_helper'

RSpec.describe "job_applications/show", type: :view do
  let(:employer) { Employer.create!(name: "MyString") }
  let(:job_application) { JobApplication.create!(employer: employer) }
  let(:job_description) { JobDescription.create!(job_application: job_application) }


  before(:each) do
    job_application.job_description = job_description
    assign(:job_application, job_application)
  end

  it "renders attributes" do
    render

    assert_select "h1>b", text: "Title:", count: 1
    assert_select "div>b", text: "Employer:", count: 1
    assert_select "div>b", text: "Status:", count: 1
  end
end
