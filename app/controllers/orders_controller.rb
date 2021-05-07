class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_adress = OrderAdress.new
  end
  def create

    @order_adress = OrderAdress.new(order_adress_params)
    if @order_adress.valid?
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_adress_params[:price],
      card: order_adress_params[:token],
      currency: 'jpy'
    )
    @order_adress.save
    return redirect_to root_path
    end
  end
  private
  def order_adress_params
    @item = Item.find(params[:item_id])
    params.permit(:postal_code,:prefecture_id,:place,:banti,:building,:token,:phone).merge(price:@item.price,item_id:@item.id,user_id:current_user.id)
 
  end
end
