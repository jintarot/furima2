FactoryBot.define do
  factory :item do
    name              {'鳥の絵'}
    item_text         {'very good'}
    category_id       {2}
    status_id         {2}
    shipping_id       {2}
    day_id            {2}
    price             {2000}
    prefecture_id     {7}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end