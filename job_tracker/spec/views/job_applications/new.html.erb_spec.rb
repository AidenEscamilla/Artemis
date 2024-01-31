require 'rails_helper'

RSpec.describe "job_applications/new", type: :view do
  before(:each) do
    assign(:job_application, JobApplication.new())
  end

  it "renders new job_application form" do
    render

    assert_select "form[action=?][method=?]", job_applications_path, "post" do
    end
  end
end
