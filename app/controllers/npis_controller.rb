class NpisController < ApplicationController
  def index
    @npis = Npi.order(updated_at: :asc)
  end
end
