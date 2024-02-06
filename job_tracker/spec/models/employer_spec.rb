require 'rails_helper'

RSpec.describe Employer, type: :model do
  let (:employer) { Employer.new(name: "Test Employer") }

  describe "validations" do
    it "is valid with valid attributes" do
      expect(employer).to be_valid
    end
  end  
end
