require 'rails_helper'

RSpec.describe "job_applications/index", type: :view do
  let(:employer) {
    Employer.create!(
      name: "MyName",
      phone_number: "1234567890",
      email: "",
      address: { "street" => "MyStreet", "city" => "MyCity", "state" => "MyState", "zip" => 12345 }
    )
  }

  before(:each) do
    assign(:job_applications, [
      JobApplication.create!(employer: employer),
      JobApplication.create!(employer: employer)
    ])
  end

  it "renders a list of job_applications" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
