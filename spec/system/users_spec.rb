require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  
  context '正しく新規登録できる' do

    it 'aaaaaaaaa' do
      
      visit new_user_registration_path
        fill_in 'Nickname', with: @user.nickname
        fill_in 'Email', with:@user.email 
        fill_in 'Password' ,with:@user.password
        fill_in 'password_confirmation' ,with:@user.password_confirmation
        fill_in 'Full-name', with:@user.first_name
        fill_in 'Full-name' ,with:@user.last_name
        fill_in 'Input-name', with:@user.last_name_kana
        fill_in 'Input-name' ,with:@user.first_name_kana
        fill_in 'birthdata' ,with:@user.birthdate
        expect{
          find('input[name="commit"]').click}.to change{
            User.count
          }.by(1)
          expect(current_path).to eq(root_path)
        
    end
  end
end
  


      