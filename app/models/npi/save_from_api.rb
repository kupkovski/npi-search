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

    if existing_npi.present?
      existing_npi.touch
      { success: true }
    else
      api_response = Npi::ApiHandler.new(attributes:).call
      return { success: false, errors: api_response[:errors] } if api_response[:success] == false

      api_response_body = api_response[:api_response_body]
      new_npi = Npi::Factory.new(attributes: api_response_body).call
      return { success: true } if new_npi.save

      { success: false, errors: new_npi.errors.full_messages }
    end
  end

  private

  attr_reader :attributes
end
