# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Npi, type: :model do
  it { should validate_presence_of(:number) }
end
