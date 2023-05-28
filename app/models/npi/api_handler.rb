# frozen_string_literal: true

require 'net/http'

# Class responsible for fetching the register from the NPI Api
class Npi::ApiHandler
  def initialize(attributes:)
    @attributes = attributes
  end

  def call
    api_response = Net::HTTP.get_response(npi_api_uri)
    return { success: false, errors: 'Error on accessing NPI API' } if api_response.code != '200'

    api_response_body = JSON(api_response.body)

    return api_internal_error(api_response_body) if api_response_body['Errors'].present?

    return no_records_found if api_response_body['result_count'].zero?

    { success: true, api_response_body: }
  end

  private

  attr_reader :attributes

  def api_internal_error(api_response_body)
    {
      success: false,
      errors: "Error on requesting data from NPI Api: #{api_response_body['Errors'].join(', ')}"
    }
  end

  def no_records_found
    { success: false, errors: 'No NPI records found for the given parameters.' }
  end

  def npi_api_uri
    URI("https://npiregistry.cms.hhs.gov/api/?#{npi_api_url_params.chomp}")
  end

  # rubocop:disable Metrics/AbcSize
  def npi_api_url_params
    <<~URL_PARAMS
      number=#{attributes[:npi]}
      &enumeration_type=#{attributes[:npi_type]}
      &taxonomy_description=#{attributes[:taxonomy]}
      &first_name=#{attributes[:first_name]}
      &last_name=#{attributes[:last_name]}
      &city=#{attributes[:city]}
      &state=#{attributes[:state]}
      &postal_code=#{attributes[:postal_code]}
      &country_code=#{attributes[:country]}
      &version=2.1
    URL_PARAMS
  end
  # rubocop:enable Metrics/AbcSize
end
