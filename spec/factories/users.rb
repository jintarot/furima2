FactoryBot.define do
  factory :user do
    
      nickname              {Faker::Name.initials(number: 2)}
      email                 {Faker::Internet.email}
      password              {'1a' + Faker::Internet.password(min_length: 6)}
      password_confirmation {password}
      first_name            {'田中'}
      first_name_kana       {'太郎'}
      last_name             {'タナカ'}
      last_name_kana        {'タロウ'}
      birthdate            {"2021-5-11"}
      
  end
end
