# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Npi::SaveFromApi do
  let(:params) {
    HashWithIndifferentAccess.new(
      'npi'         => '1003802901',
      'npi_type'    => '1',
      'first_name'  => 'John',
      'last_name'   => 'Doe',
      'city'        => '',
      'state'       => '',
      'postal_code' => '',
      'country'     => '',
      'taxonomy'    => ''
    )
  }

  subject { described_class.new(attributes: params) }

  describe '#call' do
    context 'when there is a NPI record on the database with the given number' do
      let!(:existing_npi) { FactoryBot.create(:npi, number: '1003802901') }
      it 'simply touches the record' do
        expect do
          subject.call
          existing_npi.reload
        end.to change { existing_npi.updated_at }
      end
    end

    context 'when there is no NPI record with sutch given number' do
      let(:http_response) { double('http_response') }
      context 'and API returns success' do
        let(:mocked_response) do
          {
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
          }.to_json
        end

        it 'creates a new NPI record' do
          expect(Net::HTTP)
            .to receive(:get_response)
            .and_return http_response

          expect(http_response)
            .to receive(:code)
            .and_return('200')

          expect(http_response)
            .to receive(:body)
            .and_return(mocked_response)

          expect(Npi.where(number: '1003802901')).to be_blank
          expect do
            subject.call
          end.to change { Npi.count }.by(1)
          new_npi = Npi.where(number: '1003802901').last
          expect(new_npi.enumeration_type).to eq 1
          expect(new_npi.first_name).to eq 'NEETI'
          expect(new_npi.last_name).to eq 'GOEL'
          expect(new_npi.gender).to eq 'F'
          expect(new_npi.taxonomy_code).to eq '2085R0202X'
          expect(new_npi.taxonomy_group).to eq ''
          expect(new_npi.taxonomy_description).to eq 'Radiology, Diagnostic Radiology'
          expect(new_npi.taxonomy_state).to eq 'PA'
          expect(new_npi.taxonomy_license).to eq 'MD424020'
          expect(new_npi.taxonomy_primary).to eq true
          expect(new_npi.country).to eq 'United States'
          expect(new_npi.address_1).to eq '629D LOWTHER RD'
          expect(new_npi.city).to eq 'LEWISBERRY'
          expect(new_npi.state).to eq 'PA'
          expect(new_npi.postal_code).to eq '173399527'
        end
      end

      context 'and API returns non 200 code' do
        it 'returns the API error' do
          expect(Net::HTTP)
            .to receive(:get_response)
            .and_return http_response

          expect(http_response)
            .to receive(:code)
            .and_return('500')

          expect(subject.call).to eq({ success: false, errors: 'Error on accessing NPI API' })
        end
      end

      context 'and API returns 200 code but errors inside response' do
        it 'returns the API error' do
          expect(Net::HTTP)
            .to receive(:get_response)
            .and_return http_response

          expect(http_response)
            .to receive(:code)
            .and_return('200')

          expect(http_response)
            .to receive(:body)
            .and_return({
              'Errors' => [{ 'description' => 'NPI must be 10 digits', 'field' => 'number', 'number' => '06' }]
            }.to_json)

          expect(subject.call).to eq(
            {
              success: false,
              # rubocop:disable Layout/LineLength
              errors: 'Error on requesting data from NPI Api: {"description"=>"NPI must be 10 digits", "field"=>"number", "number"=>"06"}'
              # rubocop:enable Layout/LineLength
            }
          )
        end
      end

      context 'and API returns 200 with no errors but record not found on API' do
        it 'returns the API error' do
          expect(Net::HTTP)
            .to receive(:get_response)
            .and_return http_response

          expect(http_response)
            .to receive(:code)
            .and_return('200')

          expect(http_response)
            .to receive(:body)
            .and_return({ result_count: 0 }.to_json)

          expect(subject.call).to eq(
            {
              success: false,
              errors: 'No NPI records found for the given parameters.'
            }
          )
        end
      end
    end
  end
end
