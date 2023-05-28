# frozen_string_literal: true

# Controller responsible for handling Searches
class SearchesController < ApplicationController
  def index; end

  def create
    result = Npi::SaveFromApi.new(attributes: params).call

    if result[:success]
      redirect_to npis_path
    else
      flash[:alert] = result[:errors]
      render action: :index
    end
  end
end
