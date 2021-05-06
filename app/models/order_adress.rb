class OrderAdress
  attr_accessor :price,:user_id,:item_id,:place_id,:postal_number,:phone,:banti,:area_id
  def self.save
    @order = Order.create(price:price,user_id:user_id,item_id:item_id)
    Adress.create(place:place,postal_number:postal_number,phone:phone,banti:banti,area_id:area_id,order:order.id)
  end
  end