FactoryBot.define do

  factory :user do
    nickname              {"tanaka"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"田中"}
    first_name            {"太郎"}
    family_name_reading   {"タナカ"}
    first_name_reading    {"タロウ"}
    birthday              {"0101"}
  end

end