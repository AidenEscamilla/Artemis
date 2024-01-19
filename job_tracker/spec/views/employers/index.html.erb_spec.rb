require 'rails_helper'

RSpec.describe "employers/index", type: :view do
  before(:each) do
    assign(:employers, [
      Employer.create!(
        name: "Name",
        phone_number: "Phone Number",
        email: "Email",
        address: ""
      ),
      Employer.create!(
        name: "Name",
        phone_number: "Phone Number",
        email: "Email",
        address: ""
      )
    ])
  end

  it "renders a list of employers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Phone Number".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Email".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
  end
end
