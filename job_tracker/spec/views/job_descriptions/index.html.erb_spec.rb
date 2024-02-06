require 'rails_helper'

RSpec.describe "job_descriptions/index", type: :view do
  let(:employer) { Employer.create!(name: "MyString") }
  let(:job_application1) { JobApplication.create!(employer: employer) }
  let(:job_application2) { JobApplication.create!(employer: employer) }

  before(:each) do
    assign(:job_descriptions, [
      JobDescription.create!(
        description: "MyText",
        requirements: "MyText",
        job_classification: "Job Classification",
        min_salary: 2,
        max_salary: 3,
        job_application: job_application1
      ),
      JobDescription.create!(
        description: "MyText",
        requirements: "MyText",
        job_classification: "Job Classification",
        min_salary: 2,
        max_salary: 3,
        job_application: job_application2
      )
    ])
  end

  it "renders a list of job_descriptions" do
    render

    assert_select "div>h2", text: Regexp.new("Job application:".to_s), count: 2
    assert_select "div>p", text: Regexp.new("Description:".to_s), count: 2
    assert_select "div>p", text: Regexp.new("Requirements".to_s), count: 2
    assert_select "div>p", text: Regexp.new("Job classification".to_s), count: 2
    assert_select "div>p", text: Regexp.new("Min salary:"), count: 2
    assert_select "div>p", text: Regexp.new("Max salary:"), count: 2
  end
end
