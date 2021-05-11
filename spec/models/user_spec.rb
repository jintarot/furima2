require 'rails_helper'

RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
      @email = @user.email
    end
  describe "ユーザー新規登録" do
    context '登録できない時' do
    it 'nicknameが空では登録できない' do
      user = User.new(password: "123456",nickname:"", birthdata: "1966-05-06", last_name: "山田", first_name: "太郎", last_name_kana: "ヤマダ", first_name_kana: "タロウ", email: "", password:"123456")
      user.valid?
     
    expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(password: "123456", birthdata: "1966-05-06", last_name: "山田", first_name: "太郎", last_name_kana: "ヤマダ", first_name_kana: "タロウ", email: "", password:"123456")
      user.valid?
      
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
      # emailが空では登録できないテストコードを記述します
    it 'emailに＠がなければいけない' do
      @user.email = 'helloworldgamil.com'
  
  @user.valid?
  
  expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it 'emailは一意でないといけない'do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
  end


    it 'last_nameが空では登録できない' do
      user = User.new(password: "123456", birthdata: "1966-05-06", last_name: "", first_name: "太郎", last_name_kana: "ヤマダ", first_name_kana: "タロウ", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(password: "123456", birthdata: "1966-05-06", last_name: "山田", first_name: "", last_name_kana: "ヤマダ", first_name_kana: "タロウ", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      user = User.new(password: "123456", birthdata: "1966-05-06", last_name: "山田", first_name: "太郎", last_name_kana: "", first_name_kana: "タロウ", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(password: "123456", birthdata: "1966-05-06", last_name: "山田", first_name: "かか", last_name_kana: "ヤマダ", first_name_kana: "", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
   
    it 'first_name_kanaの書式が正しくなければ登録できない' do
      user = User.new(password: "123456", birthdata: "1966-05-06", last_name: "山田", first_name: "kaka", last_name_kana: "ヤマダ", first_name_kana: "kaka", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid. Input full-width characters.")
    end
    it 'last_name_kanaの書式が正しくなければ登録できない' do
      user = User.new(password: "123456", birthdata: "1966-05-06", last_name: "山田", first_name: "太郎", last_name_kana: "kaka", first_name_kana: "かか", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid. Input full-width characters.")
    end
    it '半角数字のみでは登録できない' do
    user = User.new( birthdata: "1966-05-06", last_name: "山田", first_name: "太郎", last_name_kana: "kaka", first_name_kana: "かか", email: "wtswnhnjn123@icloud.com",password:"９９９９９９９９９９９")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid. Input full-width characters.")
  end
  it '半角英語のみでは登録できない' do
    user = User.new( birthdata: "1966-05-06", last_name: "山田", first_name: "太郎", last_name_kana: "kaka", first_name_kana: "かか", email: "wtswnhnjn123@icloud.com",password:"９９９９９９９９９９９")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid. Input full-width characters.")
  end
  it '生年月日がなければ登録できない' do
    user = User.new( birthdata: "1966-05-06", last_name: "山田", first_name: "太郎", last_name_kana: "kaka", first_name_kana: "かか", email: "wtswnhnjn123@icloud.com",password:"９９９９９９９９９９９")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid. Input full-width characters.")
  end
  
    
    
    
    
  end
    context '登録できる時' do
    it 'nickname,password,password_confirmation,last_name,last_name_kana,first_name,first_name_kanaがあれば登録できる' do
      expect(@user).to be_valid
    end
  end
  end
end
