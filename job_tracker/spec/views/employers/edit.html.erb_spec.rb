require 'rails_helper'

RSpec.describe "employers/edit", type: :view do
  let(:employer) {
    Employer.create!(
      name: "MyString",
      phone_number: "MyString",
      email: "MyString",
      address: { "street" => "MyStreet1234", "city" => "MyCity", "state" => "MyState", "zip" => 00005}
    )
  }

  before(:each) do
    assign(:employer, employer)
    render
  end

  it "renders the edit employer form" do
    render

    assert_select "form[action=?][method=?]", employer_path(employer), "post" do
        
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
