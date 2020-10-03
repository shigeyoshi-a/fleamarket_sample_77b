json.array! @items do |item|
  json.id item.id
  json.name item.name
  json.description item.description
  json.brand item.brand
  json.condition_id item.condition_id
  json.delivery_fee_id item.delivery_fee_id
  json.sending_area_id item.sending_area_id
  json.sending_days_id item.sending_days_id
  json.price item.price
  json.buyer_id item.buyer_id
  json.user_id item.user_id
  json.category_id item.category_id
  json.saler_id item.saler_id
  json.user_sign_in current_user
end