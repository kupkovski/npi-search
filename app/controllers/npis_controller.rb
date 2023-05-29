# frozen_string_literal: true

# Controller responsible for handling NPIs
class NpisController < ApplicationController
  def index
    @npis = Npi.order(updated_at: :desc).page(params[:page]).per(15)
  end
end
