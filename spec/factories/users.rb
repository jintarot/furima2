FactoryBot.define do
  factory :user do
    
      nickname              {Faker::Name.initials(number: 2)}
      email                 {Faker::Internet.email}
      password              {'1a' + Faker::Internet.password(min_length: 6)}
      password_confirmation {password}
      first_name            {'田中'}
      first_name_kana       {'タロウ'}
      last_name             {'田中'}
      last_name_kana        {'タロウ'}
      birthdata            {"2021-5-11"}
      
  end
end
