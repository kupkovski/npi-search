FactoryBot.define do
  factory :npi do
    npi { "MyString" }
    npi_type { 1 }
    taxonomy { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    city { "MyString" }
    state_options { "MyString" }
    postal_code { "MyString" }
    country_options { "MyString" }
  end
end
