json.array! @plans do |plan|
  json.id        plan.id
  json.producer  plan.producer
  json.area      plan.area
  json.dead_line plan.dead_line
  json.img_url   plan.img_url
  json.title     plan.title
  json.avatar    plan.avatar
  json.category_id plan.category_id
end
