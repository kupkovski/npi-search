require 'net/http'

class SearchesController < ApplicationController
  def index
  end

  def create
    uri = URI("https://npiregistry.cms.hhs.gov/api/?number=#{params[:npi]}&enumeration_type=#{params[:npi_type]}&taxonomy_description=#{params[:taxonomy]}&first_name=#{params[:first_name]}&last_name=#{params[:last_name]}&city=#{params[:city]}&state=#{params[:state]}&postal_code=#{params[:postal_code]}&country_code=#{params[:country]}&version=2.1")
    api_response = JSON(Net::HTTP.get(uri))

    if api_response['result_count'] == 0
      flash[:alert] = 'No records found for the given data.'
      redirect_to action: :index and return
    end

    @npi = Npi::UpdateOrInitialize.new(number: params[:npi], attributes: api_response).call

    if @npi.save
      redirect_to npis_path
    else
      flash[:alert] = @npi.errors.full_messages.join(',')
      redirect_to action: :index
    end
  end
end
