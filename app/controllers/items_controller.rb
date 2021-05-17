class ItemsController < ApplicationController
  before_action :authenticate_user! ,only:[:new,:create,:edit,:update]
  befere_action :not_collect_user, only:[:edit,:update]
  def index

    @items = Item.all.order(created_at:"DESC")
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
  def show
   find_item
  end
  def edit

  end
  def update
    
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end
  
  
  private
  def item_params
    params.require(:item).permit(:image,:name,:item_text,:prefecture_id,:category_id,:status_id,:day_id,:shipping_id,:prefecture_id,:price).merge(user_id:current_user.id)
  end
  def find_item
    @item = Item.find(params[:id])
  end
  def not_collect_user
    @item = Item.find(params[:id])
    if @item.user != current_user
      redirect_to item_path(@item.id)
    end
  end
end
