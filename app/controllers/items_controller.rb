class ItemsController < ApplicationController
  before_action :authenticate_user! ,only:[:new,:create,:edit,:update]
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    @item.find(params[:id])
   if @item.update(item_params)
    redirect_to root_path
   else
    render :edit
   end
  end
  def show
    @item = Item.find(params[:id])
  end
  private
  def item_params
    params.require(:item).permit(:image,:name,:item_text,:prefecture_id,:category_id,:status_id,:day_id,:shipping_id,:prefecture_id,:price).merge(user_id:current_user)
  end
end
