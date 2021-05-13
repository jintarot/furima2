require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
  @item =  FactoryBot.build(:item)
  end
  
describe '登録できない' do
    it 'nameがなければ登録できない' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it 'item_textが空では登録できない' do
      @item.item_text = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Item text can't be blank")
    end
    
    it 'pirceが空では登録できない' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    
    it 'status_idが0では登録できない' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
    end
    it 'prefecture_idが0では登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 0")
    end
    it 'shipping_idが0では登録できない' do
      @item.shipping_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping must be other than 0")
    end
    it 'day_idが0では登録できない' do
      @item.day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 0")
    end
    it 'category_idが0では登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
    end
    it 'imageが空では登録できない'　do
      @item.image = nil
      @image.valid?
      expect(@image.errors.full_messages).to include("Image can't be blank")
    end
    it 'priceは300以下では登録できない'　do
      @item.price = 299
      @item.valid?
      expect(@image.errors.full_messages).to include("Price is invalid")
    end
    it 'priceは999999以上であっては登録できない'　do
      @item.price = 100000000
      @item.valid?
      expect(@image.errors.full_messages).to include("Price is invalid")
    end
    it 'priceは半角数字以外では登録できない' do
      @item.price = ９９９
      @item.valid?
      expect(@image.errors.full_messages).to include("Price is invalid")
    end
  end
  describe '登録できる' do
    it '全ての要素が正しく投稿できれば登録できる' do
      expect(@item).to be_valid
    end
  end
  
  end

  
  

  

