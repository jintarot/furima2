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
    image             {'E6F3FF64-0FBE-47C1-8CBD-73DA28475AF3_1_201_a.jpeg'}
    user              {1}
  end
end