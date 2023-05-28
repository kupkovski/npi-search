class Npi < ApplicationRecord
  validates :number, presence: true, uniqueness: true

  def enumeration_description
    "NPI-#{enumeration_type}"
  end
end
