module CreateEmployerFormHelper
  include ActionView::Helpers::NumberHelper

  def format_phone_number(phone_number)
    number_to_phone(phone_number, area_code: true, delimiter: "-")
  end

  def format_address(address)
    "#{address["street"]}, #{address["city"]}, #{address["state"]} \n #{address["zip"]}"
  end
end