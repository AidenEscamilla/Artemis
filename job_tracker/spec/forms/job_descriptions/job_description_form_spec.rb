module JobDescriptions
  require 'rails_helper'

  RSpec.describe JobDescriptionForm, type: :model do
    let(:job_application) { create(:job_application) }
    let!(:job_description) { 
      create(:job_description,
        job_application: job_application,
        description: 'Job Description',
        requirements: 'Job Requirements',
        job_classification: 'Software Engineer',
        min_salary: 100,
        max_salary: 200) 
    }
    let(:job_description_form) { JobDescriptionForm.new(job_description:) }

    describe '#save!' do
      context 'when all attributes are valid' do
        it 'saves the job_description' do
          expect(job_description_form.save!).to be_truthy
        end
      end

      context 'when any attribute is invalid' do
        it 'does not save the job_description' do
          job_description_form.description = ''
          expect(job_description_form.save!).to be_falsey
        end
      end
    end

    describe '#update!' do
      context 'when all attributes are valid' do
        let(:job_description_params) {
          {
            description: 'Updated Job Description',
            requirements: 'Updated Job Requirements',
            job_classification: 'Updated Software Engineer',
            min_salary: 300,
            max_salary: 400
          }
        }

        it 'updates the job_description' do
          expect(job_description_form.update!(job_description_params)).to be_truthy
        end

        it 'updates the job_description attributes' do
          job_description_form.update!(job_description_params)
          expect(job_description.description).to eq('Updated Job Description')
          expect(job_description.requirements).to eq('Updated Job Requirements')
          expect(job_description.job_classification).to eq('Updated Software Engineer')
          expect(job_description.min_salary).to eq(300)
          expect(job_description.max_salary).to eq(400)
        end
      end

      context 'when any attribute is invalid' do
        let(:job_description_params) {
          {
            description: '',
            requirements: 'Updated Job Requirements',
            job_classification: 'Updated Software Engineer',
            min_salary: 300,
            max_salary: 400
          }
        }

        it 'does not update the job_description' do
          expect(job_description_form.update!(job_description_params)).to be_falsey
        end

        it 'does not update the job_description attributes' do
          job_description_form.update!(job_description_params)
          expect(job_description.description).to eq('Job Description')
        end
      end
    end
    
    describe 'validations' do
      context 'when all attributes are valid' do
        it 'is valid' do
          expect(job_description_form).to be_valid
        end
      end

      context 'when string attribute is blank' do
        let(:attributes) { %i[description requirements job_classification min_salary max_salary] }

        it 'is invalid' do
          attributes.each do |attribute|
            job_description_form.send("#{attribute}=", '')
            expect(job_description_form).to be_invalid
            expect(job_description_form.errors[attribute]).to eq(["can't be blank"])
          end
        end
      end

      context 'when job_classification is not a string' do
        it 'is invalid' do
          job_description_form.job_classification = "123"
          expect(job_description_form).to be_invalid
          expect(job_description_form.errors[:job_classification]).to eq(['is invalid format'])
        end
      end

      context 'when min_salary is greater than max_salary' do
        it 'is invalid' do
          job_description_form.min_salary = 300 # greater than max_salary = 200
          expect(job_description_form).to be_invalid
          expect(job_description_form.errors[:min_salary]).to eq(['must be less than max salary'])
        end
      end

      context 'when min_salary or max_salary is not a number' do
        it 'is invalid' do
          job_description_form.min_salary = 'abc'
          job_description_form.max_salary = 'def'
          expect(job_description_form).to be_invalid
          expect(job_description_form.errors[:min_salary]).to eq(['is not a number'])
          expect(job_description_form.errors[:max_salary]).to eq(['is not a number'])
        end
      end
    end
  end
end