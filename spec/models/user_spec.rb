require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it 'nicknameが空では登録できない' do
      user = User.new(nickname: "", birthdata: "1966-05-06", last_name: "山田", first_name: "太郎", last_name_kana: "ヤマダ", first_name_kana: "タロウ", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: "あああ", birthdata: "1966-05-06", last_name: "山田", first_name: "太郎", last_name_kana: "ヤマダ", first_name_kana: "タロウ", email: "",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
      # emailが空では登録できないテストコードを記述します
    end
    it 'last_nameが空では登録できない' do
      user = User.new(nickname: "あああ", birthdata: "1966-05-06", last_name: "", first_name: "太郎", last_name_kana: "ヤマダ", first_name_kana: "タロウ", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: "あああ", birthdata: "1966-05-06", last_name: "山田", first_name: "", last_name_kana: "ヤマダ", first_name_kana: "タロウ", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      user = User.new(nickname: "あああ", birthdata: "1966-05-06", last_name: "山田", first_name: "太郎", last_name_kana: "", first_name_kana: "タロウ", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      user = User.new(nickname: "あああ", birthdata: "1966-05-06", last_name: "山田", first_name: "かか", last_name_kana: "ヤマダ", first_name_kana: "", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
   
    it 'first_name_kanaの書式が正しくなければ登録できない' do
      user = User.new(nickname: "あああ", birthdata: "1966-05-06", last_name: "山田", first_name: "kaka", last_name_kana: "ヤマダ", first_name_kana: "kaka", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid. Input full-width characters.")
    end
    it 'last_name_kanaの書式が正しくなければ登録できない' do
      user = User.new(nickname: "あああ", birthdata: "1966-05-06", last_name: "山田", first_name: "太郎", last_name_kana: "kaka", first_name_kana: "かか", email: "wtswnhnjn123@icloud.com",password:"123456")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid. Input full-width characters.")
    end

    
  end
end
