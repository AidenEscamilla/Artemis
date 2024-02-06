require 'rails_helper'

RSpec.describe "employers/index", type: :view do
  before(:each) do
    assign(:employers, [
      Employer.create!(
        name: "Example",
        email: "Email",
        phone_number: "1234567890",
        address: { "street" => "MyStreet1234", "city" => "MyCity", "state" => "MyState", "zip" => 00005}
      ),
      Employer.create!(
        name: "Example",
        email: "Email",
        phone_number: "1234567890",
        address: { "street" => "MyStreet1234", "city" => "MyCity", "state" => "MyState", "zip" => 00005}
      )
    ])
  end

  it "renders a list of employers" do
    render

    assert_select "h2", text: "Name: Example", count: 2
    assert_select "div>b", text: "Email:", count: 2
    assert_select "div>b", text: "Phone Number:", count: 2
    assert_select "div>b", text: "Address:", count: 2
  end
end
