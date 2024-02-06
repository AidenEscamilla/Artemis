require 'rails_helper'

RSpec.describe "job_descriptions/show", type: :view do
  let(:employer) { Employer.create!(name: "MyString") }
  let(:job_application) { JobApplication.create!(employer: employer) }
  before(:each) do

    assign(:job_description, JobDescription.create!(
      description: "MyText",
      requirements: "MyText",
      job_classification: "Job Classification",
      min_salary: 2,
      max_salary: 3,
      job_application: job_application
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Job Classification/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(//)
  end
end
