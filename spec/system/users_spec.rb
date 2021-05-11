require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @user_email = @user.email
    @user_password = @user.password
    @user_password_confirmation = @user.password_confirmation
  end
  
  context '正しく新規登録できる' do
    it '入力された情報が正しければ,新規投稿に成功し' do  
      visit new_user_registration_path
        fill_in 'Nickname', with: @user.nickname
        fill_in 'Email', with:@user_email
        fill_in 'Password' ,with:@user_password
        fill_in 'password_confirmation' ,with:@user_password_confirmation
        fill_in 'Full-name', with:@user.first_name
        fill_in 'Full-name1' ,with:@user.last_name
        fill_in 'Input-name', with:@user.last_name_kana
        fill_in 'Input-name1' ,with:@user.first_name_kana
        fill_in '年' ,with: @user.birthdata
        
        expect{
          find('input[name="commit"]').click}.to change{
            User.count
          }.by(1)
    end
  end

  context 'ログイン' do
    it 'ログインできる' do
        visit new_user_session_path
        fill_in 'Email', with:@user_email
        fill_in 'Password', with:@user_password
  
        find('input[name="commit"]').click
        current_path == root_path
        
        
    end
  end


 

  
end
  


      