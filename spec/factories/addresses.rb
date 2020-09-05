FactoryBot.define do

  factory :address do
    post_code                     {"0000000"}
    prefecture_id                 {"1"}
    municipality                  {"渋谷区"}
    street_number                 {"0-0-0"}
    receiving_family_name         {"田中"}
    receiving_first_name          {"太郎"}
    receiving_family_name_reading {"タナカ"}
    receiving_first_name_reading  {"タロウ"}
    apartment_name                {""}
    telephone_number              {""}
  end

end