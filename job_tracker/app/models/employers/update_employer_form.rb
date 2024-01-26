class Employers::UpdateEmployerForm < Employers::EmployerForm
  include ActiveModel::Model

  attr_accessor :employer, :name, :email, :phone_number, :address

def initialize(employer_id:, params:)
  @employer = Employer.find(employer_id)

  params = employer
    .attributes
    .merge(params)
    .symbolize_keys
  
  params[:address] = params[:address].symbolize_keys

  super(params:)
end


  def call
    if valid?
      employer.update!(name:, email:, phone_number:, address:)
    else
      employer.errors.copy!(self.errors)
      employer.save!
      false
    end
  end
end