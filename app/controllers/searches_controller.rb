require 'net/http'

class SearchesController < ApplicationController
  def index
  end

  def create
    # uri = URI("https://npiregistry.cms.hhs.gov/api/?number=#{params[:npi]}&enumeration_type=#{params[:npi_type]}&taxonomy_description=#{params[:taxonomy]}&first_name=#{params[:first_name]}&last_name=#{params[:last_name]}&city=#{params[:city]}&state=#{params[:state]}&postal_code=#{params[:postal_code]}&country_code=#{params[:country]}&version=2.1")
    # @api_response = Net::HTTP.get(uri)
     # 1127757462000
    @api_response = {
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
    }

  end
end
