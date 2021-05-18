FactoryBot.define do
  factory :item_order do
    postal_code       {"1710051"}
    prefecture_id     {1}
    city              {"神戸"}
    adress            {"1111"}
    building          {"aaaaa"}
    phone_number       {"1111111"}
    assosiation :user
    asoociation :item
    
  end
end
