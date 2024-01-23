class Employers::EmployerForm
  include ActiveModel::Model
  attr_accessor :params, :name, :email, :phone_number, :address
  
  validates :name, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :address, presence: true

  def initialize(params:)
    @params = params
    @name = params[:name]
    @email = params[:email]
    @phone_number = params[:phone_number]
    @address = params[:address]
  end

  def self.call(params:)
    new(params: params).call
  end


  def call()
    return false unless valid?

    Employer.create!(name:, email:, phone_number:, address:)
    true
  end
end