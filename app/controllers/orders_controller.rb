class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @io = ItemOrder.new
  end
  def create
    @item = Item.find(params[:item_id])
    @io = ItemOrder.new(io_params)
    if @io.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: io_params[:token],
        currency: "jpy"
      )
     @io.save
      redirect_to root_path
    end
  end
  private
  def io_params
    @item = Item.find(params[:item_id])
    params.permit(:postal_code,:prefecture_id,:city,:adress,:building,:phone_number,:token).merge(user_id:current_user.id,item_id:@item.id)
  end
end
