FactoryBot.define do
  factory :item do
    product              {"ドラえもん"}
    product_copy         {"22世紀猫型ロボット"}
    category_id          {2}
    status_id            {2}
    burden_id            {2}
    area_id              {2}
    area_day_id          {2}
    price                {10000}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/camera.png'), filename: 'camera.png')
    end
  end
end