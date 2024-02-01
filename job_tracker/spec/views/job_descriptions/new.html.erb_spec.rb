require 'rails_helper'

RSpec.describe "job_descriptions/new", type: :view do
  before(:each) do
    assign(:job_description, JobDescription.new(
      description: "MyText",
      requirements: "MyText",
      job_classification: "MyString",
      min_salary: 1,
      max_salary: 1,
      job_application: nil
    ))
  end

  it "renders new job_description form" do
    render

    assert_select "form[action=?][method=?]", job_descriptions_path, "post" do

      assert_select "textarea[name=?]", "job_description[description]"

      assert_select "textarea[name=?]", "job_description[requirements]"

      assert_select "input[name=?]", "job_description[job_classification]"

      assert_select "input[name=?]", "job_description[min_salary]"

      assert_select "input[name=?]", "job_description[max_salary]"

      assert_select "input[name=?]", "job_description[job_application_id]"
    end
  end
end
