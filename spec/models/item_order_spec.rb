require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do 
  @io = FactoryBot.build(:item_order)
  end
  describe '登録できない' do
    it 'postai_codeがなければ登録できない' do
      @io.postal_code = ""
      @io.valid?
      expect(@io.errors.full_messages).to include("Postal_code can't be blank")
    end
    it 'item_textが空では登録できない' do
      @io.prefecture_id = 0
      @io.valid?
      expect(@io.errors.full_messages).to include("Prefecture_id must be other than 0")
    end
    
    it 'cityが空では登録できない' do
      @io.city = ""
      @io.valid?
      expect(@io.errors.full_messages).to include("City can't be blank")
    end
    
    it 'adressが空では登録できない'　do
      @io.adress = ""
      @image.valid?
      expect(@image.errors.full_messages).to include("Adress can't be blank")
    end
    it 'phone_numberが空では投稿できない'　do
      @io.pshone_number = ""
      @io.valid?
      expect(@image.errors.full_messages).to include("Phone number can't be blank")
    end
    

  end
  describe '登録できる' do
    it '全ての要素が正しく投稿できれば登録できる' do
      expect(@io).to be_valid
    end
  end
  
  end
  
end
