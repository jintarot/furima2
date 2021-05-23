class OrdersController < ApplicationController
  before_action :authenticate_user!, only: %i[create index]
  before_action :find_item, only: %i[create index]
  before_action :ordered, only: %i[index create]
  def index
    @io = ItemOrder.new
  end

  def create
    @io = ItemOrder.new(io_params)
    if @io.valid?
      if current_user.card.nil?
        item_pay
      else
        card_pay
      end
      @io.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def io_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :adress, :building, :phone_number).merge(
      token: params[:token], user_id: current_user.id, item_id: @item.id
    )
  end

  def ordered
    redirect_to root_path if current_user == @item.user || !@item.order.nil?
  end

  def item_pay
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def card_pay
    @card = current_user.card
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @card.card_token,
      currency: 'jpy'
    )
  end
end
