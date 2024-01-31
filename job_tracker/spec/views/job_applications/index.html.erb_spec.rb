require 'rails_helper'

RSpec.describe "job_applications/index", type: :view do
  before(:each) do
    assign(:job_applications, [
      JobApplication.create!(),
      JobApplication.create!()
    ])
  end

  it "renders a list of job_applications" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
