require 'rails_helper'

RSpec.describe "Npis", type: :request do
  describe "GET /index" do
    # 1003802901
    # 1003864232
    # 1013955343
    # HashWithIndifferentAccess.new({
    #   "result_count": 1,
    #   "results": [
    #     {
    #       "created_epoch": "1127757462000",
    #       "enumeration_type": "NPI-1",
    #       "last_updated_epoch": "1326893645000",
    #       "number": "1003802901",
    #       "addresses": [
    #         {
    #           "country_code": "US",
    #           "country_name": "United States",
    #           "address_purpose": "MAILING",
    #           "address_type": "DOM",
    #           "address_1": "629D LOWTHER RD",
    #           "city": "LEWISBERRY",
    #           "state": "PA",
    #           "postal_code": "173399527",
    #           "telephone_number": "717-932-5200",
    #           "fax_number": "717-932-3095"
    #         },
    #         {
    #           "country_code": "US",
    #           "country_name": "United States",
    #           "address_purpose": "LOCATION",
    #           "address_type": "DOM",
    #           "address_1": "629D LOWTHER RD",
    #           "city": "LEWISBERRY",
    #           "state": "PA",
    #           "postal_code": "173399527",
    #           "telephone_number": "717-932-5200",
    #           "fax_number": "717-932-3095"
    #         }
    #       ],
    #       "practiceLocations": [],
    #       "basic": {
    #         "first_name": "NEETI",
    #         "last_name": "GOEL",
    #         "middle_name": "BHATIA",
    #         "credential": "MD",
    #         "sole_proprietor": "NO",
    #         "gender": "F",
    #         "enumeration_date": "2005-09-26",
    #         "last_updated": "2012-01-18",
    #         "status": "A",
    #         "name_prefix": "Dr.",
    #         "name_suffix": "--"
    #       },
    #       "taxonomies": [
    #         {
    #           "code": "2085R0202X",
    #           "taxonomy_group": "",
    #           "desc": "Radiology, Diagnostic Radiology",
    #           "state": "PA",
    #           "license": "MD424020",
    #           "primary": true
    #         }
    #       ],
    #       "identifiers": [
    #         {
    #           "code": "05",
    #           "desc": "MEDICAID",
    #           "issuer": nil,
    #           "identifier": "101015234",
    #           "state": "PA"
    #         }
    #       ],
    #       "endpoints": [],
    #       "other_names": []
    #     }
    #   ]
    # })
    pending "add some examples (or delete) #{__FILE__}"
  end
end
