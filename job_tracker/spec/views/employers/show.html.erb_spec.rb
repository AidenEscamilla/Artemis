require 'rails_helper'

RSpec.describe "employers/show", type: :view do
  before(:each) do
    assign(:employer, Employer.create!(
      name: "Name",
      phone_number: "Phone Number",
      email: "Email",
      address: ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(//)
  end
end
