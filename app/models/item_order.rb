class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:adress,:building,:phone_number,:item_id,:user_id
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :adress
    validates :phone_number
    validates :item_id
    validates :user_id
  end
  def save
    @order = Order.create(item_id:item_id,user_id:user_id)
    Adress.create(postal_code: postal_code,prefecture_id: prefecture_id,city:city,adress: adress,building: building,phone_number: phone_number,order_id: @order.id)
  end
end