# frozen_string_literal: true

require 'net/http'

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
      api_response = Net::HTTP.get_response(npi_api_uri)
      return { success: false, errors: 'Error on accessing NPI API'} if api_response.code != '200'

      api_response_body = JSON(api_response.body)

      if api_response_body['Errors'].present?
        return {
          success: false,
          errors: "Error on requesting data from NPI Api: #{api_response_body['Errors'].join(', ')}"
        }
      end

      if api_response_body['result_count'].zero?
        return { success: false, errors: 'No NPI records found for the given parameters.' }
      end

      new_npi = Npi::Factory.new(attributes: api_response_body).call
      return { success: true } if new_npi.save

      { success: false, errors: new_npi.errors.full_messages }
    end
  end

  private

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

  attr_reader :attributes
end
