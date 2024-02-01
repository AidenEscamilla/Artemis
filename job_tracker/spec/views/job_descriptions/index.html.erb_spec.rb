require 'rails_helper'

RSpec.describe "job_descriptions/index", type: :view do
  before(:each) do
    assign(:job_descriptions, [
      JobDescription.create!(
        description: "MyText",
        requirements: "MyText",
        job_classification: "Job Classification",
        min_salary: 2,
        max_salary: 3,
        job_application: nil
      ),
      JobDescription.create!(
        description: "MyText",
        requirements: "MyText",
        job_classification: "Job Classification",
        min_salary: 2,
        max_salary: 3,
        job_application: nil
      )
    ])
  end

  it "renders a list of job_descriptions" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Job Classification".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
