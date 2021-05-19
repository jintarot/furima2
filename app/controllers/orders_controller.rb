class OrdersController < ApplicationController
  before_action :authenticate_user! ,only:[:create,:index]
  before_action :find_item
  before_action :ordered
  def index
    @io = ItemOrder.new
  end
  def create
    @io = ItemOrder.new(io_params)
    if @io.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: "jpy"
      )
      @io.save
      redirect_to item_path(@item.id)
    else
      render :index
    end
  end

  private
  def find_item
    @item = Item.find(params[:item_id])
  end
  def io_params
    params.require(:item_order).permit(:postal_code,:prefecture_id,:city,:adress,:building,:phone_number).merge(user_id:current_user.id,item_id:@item.id)
  end
  def ordered
    if current_user == @item.user || @item.order != nil
      redirect_to root_path
    end
  end
  
end
