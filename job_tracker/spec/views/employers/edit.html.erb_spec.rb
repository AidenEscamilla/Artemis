require 'rails_helper'

RSpec.describe "employers/edit", type: :view do
  let(:employer) {
    Employer.create!(
      name: "MyString",
      phone_number: "MyString",
      email: "MyString",
      address: ""
    )
  }

  before(:each) do
    assign(:employer, employer)
  end

  it "renders the edit employer form" do
    render

    assert_select "form[action=?][method=?]", employer_path(employer), "post" do

      assert_select "input[name=?]", "employer[name]"

      assert_select "input[name=?]", "employer[phone_number]"

      assert_select "input[name=?]", "employer[email]"

      assert_select "input[name=?]", "employer[address]"
    end
  end
end
