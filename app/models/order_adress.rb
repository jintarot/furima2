class OrderAdress

  include ActiveModel::Model
  attr_accessor :place,:phone,:postal_code,:banti,:token,:user_id,:item_id,:price,:building,:prefecture_id
  def save
    @order = Order.create(price:price,user_id:user_id,item_id:item_id)
    Adress.create(place:place,postal_code:postal_code,phone:phone,banti:banti,building:building,prefecture_id:prefecture_id,order_id:@order.id)

  end
  end