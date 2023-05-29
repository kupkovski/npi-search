# frozen_string_literal: true

module NpiHelper
  def enumeration_description(npi)
    "NPI-#{npi.enumeration_type}"
  end
end
