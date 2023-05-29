class Npi < ApplicationRecord
  validates :number, presence: true, uniqueness: true
end
