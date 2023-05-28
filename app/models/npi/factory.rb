class Npi::Factory
  def initialize(attributes:)
    @attributes = attributes
  end

  def call
    data = attributes['results'].first
    taxonomy = data['taxonomies'].first
    address = data['addresses'].find {|a| a['address_purpose'].upcase == 'LOCATION' }

    Npi.new.tap do |npi|
      npi.number = data['number'].to_i
      npi.enumeration_type = data['enumeration_type'] == 'NPI-1' ? 1 : 2

      npi.taxonomy_code = taxonomy['code']
      npi.taxonomy_group = taxonomy['taxonomy_group']
      npi.taxonomy_description = taxonomy['desc']
      npi.taxonomy_state = taxonomy['state']
      npi.taxonomy_license = taxonomy['license']
      npi.taxonomy_primary = taxonomy['primary']

      npi.country = address['country_name']
      npi.address_1 = address['address_1']
      npi.city = address['city']
      npi.state = address['state']
      npi.postal_code = address['postal_code']

      npi.first_name = data['basic']['first_name']
      npi.last_name = data['basic']['last_name']
      npi.gender = data['basic']['gender']
    end
  end

  private
  attr_reader :attributes
end
