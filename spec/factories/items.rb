FactoryBot.define do

  factory :item do
    name              {"商品1"}
    description       {"テスト"}
    brand             {"テスト"}
    condition_id      {"1"}
    delivery_fee_id   {"1"}
    sending_area_id   {"1"}
    sending_days_id   {"1"}
    price             {"500"}
    saler_id          {"1"}
    category_id       {"5"}
  end

end