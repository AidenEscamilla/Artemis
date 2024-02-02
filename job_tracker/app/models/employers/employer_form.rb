class Employers::EmployerForm
  include ActiveModel::Model

  attr_accessor :employer, :name, :email, :phone_number, :address
  validates :name, :email, :phone_number, :address, presence: true
  validates :name, format: { with: /\A[a-zA-Z\s]+\z/ }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate  :phone_number_is_valid
  validate  :address_is_valid

  def initialize(employer:)
    @employer = employer
    @name = employer.name
    @email = employer.email
    @phone_number = employer.phone_number
    @address = employer.address.symbolize_keys
  end

  def save!
    if valid?
      phone_number = @phone_number.gsub(/\D/, "")  # Remove all non-digits
      Employer.create!(name:, email:, phone_number:, address:)
    else
      employer.errors.copy!(self.errors)
      false
    end
  end

  def update!(employer_params)
    self.attributes = employer_params #TODO: figure out how to set attributes
    if valid?
      employer.update!(name:, email:, phone_number:, address:)
    else
      employer.errors.copy!(self.errors)
      false
    end
  end

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
    valid_city
    valid_state
    valid_zip
  end

  def valid_street
    if address[:street].blank?
      errors.add(:street, 'can\'t be blank')
      return
    end

    unless address[:street].match?(street_format)
      errors.add(:street, 'is invalid format')
    end
  end

  def valid_city
    if address[:city].blank?
      errors.add(:city, 'can\'t be blank')
      return
    end

    unless address[:city].match?(city_state_format)
      errors.add(:city, 'is invalid format')
    end
  end

  def valid_state
    if address[:state].blank?
      errors.add(:state, 'can\'t be blank')
      return
    end

    unless address[:state].match?(city_state_format)
      errors.add(:state, 'is invalid format')
    end
  end

  def valid_zip
    if address[:zip].blank?
      errors.add(:zip, 'can\'t be blank')
      return
    end

    unless address[:zip].match?(/\A\d{5}\z/) # US zip code (5 decimals)
      errors.add(:zip, 'is invalid format')
    end
  end

  def street_format
    return /\A[a-zA-Z0-9\s]+\z/
  end

  def city_state_format
    return /\A[a-zA-Z\s]+\z/
  end
end