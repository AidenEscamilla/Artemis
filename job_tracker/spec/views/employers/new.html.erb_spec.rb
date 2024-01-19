require 'rails_helper'

RSpec.describe "employers/new", type: :view do
  before(:each) do
    assign(:employer, Employer.new(
      name: "MyString",
      phone_number: "MyString",
      email: "MyString",
      address: ""
    ))
  end

  it "renders new employer form" do
    render

    assert_select "form[action=?][method=?]", employers_path, "post" do

      assert_select "input[name=?]", "employer[name]"

      assert_select "input[name=?]", "employer[phone_number]"

      assert_select "input[name=?]", "employer[email]"

      assert_select "input[name=?]", "employer[address]"
    end
  end
end
