require 'rails_helper'

RSpec.describe JobDescription, type: :model do
  let!(:job_application) { create(:job_application) }
  let!(:job_description) { create(:job_description, job_application:)  }

  describe 'validations' do
    context 'when created with job_application' do
      it 'can be saved' do
        expect(job_description).to be_valid
      end
    end

    context 'when created without job_application' do
      before { job_description.job_application = nil }

      it 'cannot be saved' do
        expect(job_description).to_not be_valid
      end
    end
  end
end
