class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:adress,:building,:phone_number,:item_id,:user_id
  with_options presence: true do
    validates :postal_code,format:{with:/\A[0-9]+\z/,message:"is invalid. Input full-width characters."}
    validates :prefecture_id,numericality:{other_than:0}
    validates :city,format:{with:/\A[ぁ-んァ-ヶ一-龥々ー]+\z/,message:"is invalid. Input full-width characters."}
    validates :adress
    validates :phone_number,format:{with:/\A\d{10,11}\z/,message:"is invalid. Input full-width characters"}
    validates :user_id
    validates :item_id
  end
  def save
    @order = Order.create(item_id:item_id,user_id:user_id)
    Adress.create(postal_code: postal_code,prefecture_id: prefecture_id,city:city,adress: adress,building: building,phone_number: phone_number,order_id: @order.id)
  end
end