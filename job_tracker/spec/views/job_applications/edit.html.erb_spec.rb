require 'rails_helper'

RSpec.describe "job_applications/edit", type: :view do
  let(:employer) {
    Employer.create!(
      name: "MyName",
      phone_number: "1234567890",
      email: "",
      address: { "street" => "MyStreet", "city" => "MyCity", "state" => "MyState", "zip" => 12345 }
    )
  }
  let(:job_application) {
    JobApplication.create!(employer: employer)
  }

  before(:each) do
    assign(:job_application, job_application)
  end

  it "renders the edit job_application form" do
    render

    assert_select "form[action=?][method=?]", job_application_path(job_application), "post" do
    end
  end
end
