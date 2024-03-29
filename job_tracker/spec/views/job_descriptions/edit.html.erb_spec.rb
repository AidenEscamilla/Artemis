require 'rails_helper'

RSpec.describe "job_descriptions/edit", type: :view do
  let(:employer) { Employer.create!(name: "MyString") }
  let(:job_application) { JobApplication.create!(employer: employer) }

  let(:job_description) {
    JobDescription.create!(
      description: "MyText",
      requirements: "MyText",
      job_classification: "MyString",
      min_salary: 1,
      max_salary: 1,
      job_application: job_application
    )
  }

  before(:each) do
    assign(:job_description, job_description)
  end

  it "renders the edit job_description form" do
    render

    assert_select "form[action=?][method=?]", job_description_path(job_description), "post" do

      assert_select "textarea[name=?]", "job_description[description]"

      assert_select "textarea[name=?]", "job_description[requirements]"

      assert_select "input[name=?]", "job_description[job_classification]"

      assert_select "input[name=?]", "job_description[min_salary]"

      assert_select "input[name=?]", "job_description[max_salary]"

      assert_select "select[name=?]", "job_description[job_application_id]"
    end
  end
end
