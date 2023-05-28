class NpisController < ApplicationController
  def index
    @npis = Npi.order(updated_at: :desc).page(params[:page]).per(15)
  end
end
