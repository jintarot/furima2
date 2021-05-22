FactoryBot.define do
  factory :item_order do
    postal_code       { '171-0051' }
    prefecture_id     { 1 }
    city              { '神戸' }
    adress            { '1111' }
    building          { 'aaaaa' }
    phone_number { '07018196422' }
    token { 'hello' }
  end
end
