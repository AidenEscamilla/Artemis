class Employers::EmployerForm
  include ActiveModel::Model

  attr_accessor :name, :email, :phone_number, :address
  validates :name, :email, :phone_number, :address, presence: true
  validates :name, format: { with: /\A[a-zA-Z\s]+\z/ }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate  :phone_number_is_valid
  validate  :address_is_valid

  def initialize(params: {})
    @name = params[:name]
    @email = params[:email]
    @phone_number = params[:phone_number]
    @address = params[:address]
  end

  def call
    return unless valid?

    Employer.create!(name:, email:, phone_number:, address:)
  end

  # def self.model_name
  #   ActiveModel::Name.new(self, nil, 'EmployerForm')
  # end
  private

  def phone_number_is_valid
    return unless phone_number.present?

    unless phone_number.match?(/\A\d{10}\z/) || phone_number.match?(/\A[\(]?\d{3}[\)]?[\s-]\d{3}-\d{4}\z/)
      errors.add(:phone_number, 'is not a valid phone number')
    end
  end

  def address_is_valid
    return unless address.present?

    valid_street
    valid_city_and_state
    valid_zip
  end

  def valid_street
    if address[:street].blank?
      errors.add(:street, 'can\'t be blank')
      return
    end

    unless address[:street].match?(/\A[a-zA-Z0-9\s]+\z/) && address[:street].present?
      errors.add(:street, 'is invalid format')
    end
  end

  def valid_city_and_state
    if address[:city].blank?
      errors.add(:city, 'can\'t be blank')
      return
    end
    if address[:state].blank?
      errors.add(:state, 'can\'t be blank')
      return
    end

    unless address[:city].match?(/\A[a-zA-Z\s]+\z/)
      errors.add(:city, 'is invalid format')
    end

    unless address[:state].match?(/\A[a-zA-Z\s]+\z/)
      errors.add(:state, 'is invalid format')
    end
  end

  def valid_zip
    if address[:zip].blank?
      errors.add(:zip, 'can\'t be blank')
      return
    end

    unless address[:zip].match?(/\A\d{5}\z/)
      errors.add(:zip, 'is invalid format')
    end
  end
end