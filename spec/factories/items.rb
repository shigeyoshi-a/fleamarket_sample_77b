FactoryBot.define do

  factory :item do

    association :user
    # association :saler, factory: :user
    association :category

    saler
    name              {"商品1"}
    description       {"テスト"}
    brand             {"テスト"}
    condition_id      {"1"}
    delivery_fee_id   {"1"}
    sending_area_id   {"1"}
    sending_days_id   {"1"}
    price             {"500"}
  end

end