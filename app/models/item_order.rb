class ItemOrder
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:adress,:building,:phone_number,:item_id,:user_id
  with_options presence: true do
    validates :postal_code
    validates :prefecture_id,numericality:{other_than:0}
    validates :city
    validates :adress
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  with_options presence: true do
    validates :postal_code
   
  end
  def save
    @order = Order.create(item_id:item_id,user_id:user_id)
    Adress.create(postal_code: postal_code,prefecture_id: prefecture_id,city:city,adress: adress,building: building,phone_number: phone_number,order_id: @order.id)
  end
end