require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  
  before do 
  @io = FactoryBot.build(:item_order)
  end  
  
  describe 'can' do
    it 'postai_codeがなければ登録できない' do
      @io.postal_code = ""
       @io.valid?
       expect(@io.errors.full_messages).to include("Postal code can't be blank")
     end
    it 'postal_codeの書式が違えば登録できない' do
      @io.postal_code = "helloworld"
      @io.valid?
      expect(@io.errors.full_messages).to include("Postal code is invalid. Input full-width characters.")
    end
     it 'prefecture_idが空では登録できない' do
       @io.prefecture_id = 0
       @io.valid?
       expect(@io.errors.full_messages).to include("Prefecture must be other than 0")
     end
   
     it 'cityが空では登録できない' do
       @io.city = ""
       @io.valid?
       expect(@io.errors.full_messages).to include("City can't be blank")
     end
   it 'cityの書式が違えば登録できない' do
    @io.city = "hello"
    @io.valid?
    expect(@io.errors.full_messages).to include("City is invalid. Input full-width characters.")
   end
     it 'adressが空では登録できない'do
       @io.adress = ""
       @io.valid?
       expect(@io.errors.full_messages).to include("Adress can't be blank")
     end
     it 'user情報がなければ購入できない' do
      @io.user_id = nil
      @io.valid?
      expect(@io.errors.full_messages).to include("User can't be blank")
     end
     it 'item情報がなければ購入できない' do
      @io.item_id = nil
      @io.valid?
      expect(@io.errors.full_messages).to include("Item can't be blank")
     end
     it 'phone_numberの書式がおかしければ' do
      @io.phone_number = "hello"
      @io.valid?
      expect(@io.errors.full_messages).to include("Phone number is invalid. Input full-width characters")
     end
     it 'phone_numberが空白であれば購入できない' do
      @io.phone_number = ""
      @io.valid?
      expect(@io.errors.full_messages).to include("Phone number can't be blank")
     end
     
  end
  describe 'can not' do
    it '全ての要素が正しく投稿できれば登録できる' do
      expect(@io).to be_valid
    end
   end
     

    
    
  
    

    
end 
  
 
  
  
  

