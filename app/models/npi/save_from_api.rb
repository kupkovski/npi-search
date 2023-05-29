# frozen_string_literal: true

# Class with the business case flow
# for simply touching the record if already exists
# or fetching the Npi record from the api
# and deal with possible problems
class Npi::SaveFromApi
  def initialize(attributes:)
    @attributes = attributes
  end

  def call
    existing_npi = Npi.find_by(number: attributes[:npi])

    return update_existing_npi(existing_npi) if existing_npi.present?

    return { success: false, errors: api_response[:errors] } if api_response[:success] == false

    new_npi = build_npi_record(api_response)
    return { success: true } if new_npi.save

    { success: false, errors: new_npi.errors.full_messages }
  end

  private

  def update_existing_npi(existing_npi)
    existing_npi.touch
    { success: true }
  end

  def api_response
    @api_response ||= Npi::ApiHandler.new(attributes:).call
  end

  def build_npi_record(api_response)
    api_response_body = api_response[:api_response_body]

    Npi::Factory.new(attributes: api_response_body).call
  end

  attr_reader :attributes
end
