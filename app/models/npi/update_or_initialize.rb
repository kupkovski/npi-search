class Npi::UpdateOrInitialize
  def initialize(number:, attributes:)
    @number = number
    @attributes = attributes
  end

  def call
    existing_npi = Npi.where(number: number)
    if existing_npi.present?
      record = existing_npi.first
      record.touch
      record
    else
      initialize_npi
    end

  end

  private attr_reader :number, :attributes

  def initialize_npi
    debugger
    Npi::Factory.new(attributes: attributes).call
  end
end
