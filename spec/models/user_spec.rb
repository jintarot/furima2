require 'rails_helper'

RSpec.describe @User, type: :model do
    before do
       @user = FactoryBot.build( @user)
      @email =  @user.email
    end
  describe "ユーザー新規登録" do
    context '登録できない時' do
    it 'nicknameが空では登録できない' do
       @user.nickname = ""
     @user.valid?
     
    expect @user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
       @user.email = ""
     @user.valid?
      
      expect (@user.errors.full_messages).to include("Email can't be blank")
    end
      
    it 'emailに＠がなければいけない' do
       @user.email = 'helloworldgamil.com'
  
   @user.valid?
  
  expect( @user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailは一意でないといけない'do
       @user.save
      another_user = FactoryBot.build( @user)
      another_user.email =  @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
  end
    it 'passwordがなければ登録できない' do
       @user.password = ""
       @user.valid?
      expect( @user.errors.full_messages).to include("Password can't be blank")
    end
    it 'last_nameが空では登録できない' do
       @user.last_name = ""
     @user.valid?
      expect (@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ""
     @user.valid?
      expect (@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
       @user.last_name_kana = ""
     @user.valid?
      expect (@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ""
     @user.valid?
      expect (@user.errors.full_messages).to include("First name kana can't be blank")
    end
   
    it 'first_name_kanaの書式が正しくなければ登録できない' do
       @user.first_name_kana = "aaaaaa"
     @user.valid?
      expect (@user.errors.full_messages).to include("First name kana is invalid. Input full-width characters.")
    end
    it 'last_name_kanaの書式が正しくなければ登録できない' do
      @user.last_name_kana = "aaaaaaa"
     @user.valid?
      expect (@user.errors.full_messages).to include("Last name kana is invalid. Input full-width characters.")
    end
    it 'passwordが半角英字のみでは登録できない' do
     @user.password = "ｓｊｄｋｄｖｂ"
     @user.valid?
      expect (@user.errors.full_messages).to include("Password is invalid")
  end
  it 'passwordが半角数字のみでは登録できない' do
     @user.password = "９９９９９９９"
     @user.valid?
      expect (@user.errors.full_messages).to include("Password is invalid")
  end
  it '生年月日がなければ登録できない' do
     @user.birthdata = ""
     @user.valid?
      expect (@user.errors.full_messages).to include("Birthdata can't be blank")
  end
  it 'last_nameの書式が間違えていれば登録できない' do
    @user.last_name = "hello"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
  end
  it 'first_nameの書式が適切でなければ登録できない' do
    @user.first_name ="hello"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
  end
  
    context '登録できる時' do
    it 'nickname,password,password_confirmation,last_name,last_name_kana,first_name,first_name_kanaがあれば登録できる' do
      expect( @user).to be_valid
    end
  end
  end
end
