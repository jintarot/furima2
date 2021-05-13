class ItemsController < ApplicationController
  before_action :authenticate_user! ,only:[:new,:create,:edit,:update]
  
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
  
  private
  def item_params
    params.require(:item).permit(:image,:name,:item_text,:prefecture_id,:category_id,:status_id,:day_id,:shipping_id,:prefecture_id,:price).merge(user_id:current_user)
  end
end
