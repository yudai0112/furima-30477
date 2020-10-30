FactoryBot.define do
  factory :order do
    user_id { rand(1..100) }
    item_id { rand(1..100) }
  end
end
