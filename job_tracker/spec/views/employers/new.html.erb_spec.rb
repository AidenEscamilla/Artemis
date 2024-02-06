require 'rails_helper'

RSpec.describe "employers/new", type: :view do
  before(:each) do
    assign(:employer, Employer.new(
      name: "MyName",
      phone_number: "1234567890",
      email: "Email@gmail.com",
      address: { "street" => "MyStreet", "city" => "MyCity", "state" => "MyState", "zip" => 12345 }
    ))
  end

  it "renders new employer form" do
    render

    assert_select "form[action=?][method=?]", employers_path, "post" do

      assert_select "input[name=?]", "employer[name]"

      assert_select "input[name=?]", "employer[phone_number]"

      assert_select "input[name=?]", "employer[email]"

      assert_select "input[name=?]", "employer[address][street]"

      assert_select "input[name=?]", "employer[address][city]"

      assert_select "input[name=?]", "employer[address][state]"

      assert_select "input[name=?]", "employer[address][zip]"
    end
  end
end
