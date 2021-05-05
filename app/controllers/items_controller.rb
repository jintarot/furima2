class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create

    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def edit
    find_item
  end
  def update
    find_item
    if @item.update(item_params)
      render :show
    else
      render :edit
    end
  end
  def show
    @item = Item.find(params[:id])
  end
  private
  def item_params
    params.require(:item).permit(:name,:text,:category_id,:status_id,:shipping_id,:prefecture_id,:days_id,:image,:price).merge(user_id:current_user.id)
  end
  def find_item
    @item = Item.find(params[:id])
  end
end
