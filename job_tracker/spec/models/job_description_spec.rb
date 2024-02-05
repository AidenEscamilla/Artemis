require 'rails_helper'

RSpec.describe JobDescription, type: :model do
  let!(:job_application) { create(:job_application) }
  let!(:job_description) { create(:job_description, job_application:)  }

  describe 'validations' do
    context 'when all attributes are valid' do
      it 'is valid' do
        p job_description
      end
    end
  end
end
