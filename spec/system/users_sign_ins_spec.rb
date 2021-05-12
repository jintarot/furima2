require 'rails_helper'

RSpec.describe "UsersSignIns", type: :system do
  before do
    @user = FactoryBot.build(:user)
    @user_email = @user.email
    @user_password = @user_password = @user.password
  end

  context 'ログイン' do
    it 'ログインできる' do
        visit new_user_session_path
        fill_in 'Email', with:@user_email
        fill_in 'Password', with:@user_password
  
        find('input[name="commit"]').click
        
    end
  end
      
  end
  



























end
