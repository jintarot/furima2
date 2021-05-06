class OrdersController < ApplicationController
  def index
    @order_adress = OrderAdress.new
    @item = Item.find(params[:item_id])
  end
  def create
    @item = Item.find(params[:item_id])
    @orderadress = OrderAdress.new(order_adress_params)
    if @orderadress.valid?
      @orderadress.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end
  private
  def order_adress_params
    @item = Item.find(params[:item_id])
    params.require(:orderadress).permit(:place,:phone,:postal_number,:banti,:area_id).merge(user_id:current_user.id,item_id:@item.id,price:@item.price)
  end
end
