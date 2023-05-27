require 'net/http'

class SearchesController < ApplicationController
  def index
  end

  def create
    # uri = URI("https://npiregistry.cms.hhs.gov/api/?number=#{params[:npi]}&enumeration_type=#{params[:npi_type]}&taxonomy_description=#{params[:taxonomy]}&first_name=#{params[:first_name]}&last_name=#{params[:last_name]}&city=#{params[:city]}&state=#{params[:state]}&postal_code=#{params[:postal_code]}&country_code=#{params[:country]}&version=2.1")
    # @api_response = Net::HTTP.get(uri)
     # 1127757462000
    @api_response = HashWithIndifferentAccess.new({
      "result_count": 1,
      "results": [
        {
          "created_epoch": "1127757462000",
          "enumeration_type": "NPI-1",
          "last_updated_epoch": "1326893645000",
          "number": "1003802901",
          "addresses": [
            {
              "country_code": "US",
              "country_name": "United States",
              "address_purpose": "MAILING",
              "address_type": "DOM",
              "address_1": "629D LOWTHER RD",
              "city": "LEWISBERRY",
              "state": "PA",
              "postal_code": "173399527",
              "telephone_number": "717-932-5200",
              "fax_number": "717-932-3095"
            },
            {
              "country_code": "US",
              "country_name": "United States",
              "address_purpose": "LOCATION",
              "address_type": "DOM",
              "address_1": "629D LOWTHER RD",
              "city": "LEWISBERRY",
              "state": "PA",
              "postal_code": "173399527",
              "telephone_number": "717-932-5200",
              "fax_number": "717-932-3095"
            }
          ],
          "practiceLocations": [],
          "basic": {
            "first_name": "NEETI",
            "last_name": "GOEL",
            "middle_name": "BHATIA",
            "credential": "MD",
            "sole_proprietor": "NO",
            "gender": "F",
            "enumeration_date": "2005-09-26",
            "last_updated": "2012-01-18",
            "status": "A",
            "name_prefix": "Dr.",
            "name_suffix": "--"
          },
          "taxonomies": [
            {
              "code": "2085R0202X",
              "taxonomy_group": "",
              "desc": "Radiology, Diagnostic Radiology",
              "state": "PA",
              "license": "MD424020",
              "primary": true
            }
          ],
          "identifiers": [
            {
              "code": "05",
              "desc": "MEDICAID",
              "issuer": nil,
              "identifier": "101015234",
              "state": "PA"
            }
          ],
          "endpoints": [],
          "other_names": []
        }
      ]
    })

    data = @api_response['results'].first
    taxonomy = data['taxonomies'].first
    address = data['addresses'].find {|a| a['address_purpose'].upcase == 'LOCATION' }

    @npi = Npi.new.tap do |npi|
      npi.number = data['number']
      npi.enumeration_type = data['enumeration_type'] == 'NPI-1' ? 1 : 2

      npi.taxonomy_code = taxonomy['code']
      npi.taxonomy_group = taxonomy['taxonomy_group']
      npi.taxonomy_description = taxonomy['desc']
      npi.taxonomy_state = taxonomy['state']
      npi.taxonomy_license = taxonomy['license']
      npi.taxonomy_primary = taxonomy['primary']

      npi.country = address['country_name']
      npi.address_1 = address['address_1']
      npi.city = address['city']
      npi.state = address['state']
      npi.postal_code = address['postal_code']

      npi.first_name = data['basic']['first_name']
      npi.last_name = data['basic']['last_name']
      npi.gender = data['basic']['gender']
    end

    if @npi.save
      redirect_to npis_path
    else
      flash[:alert] = @npi.errors.full_messages.join(',')
      redirect_to action: :index
    end
  end
end
