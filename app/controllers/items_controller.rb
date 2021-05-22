class ItemsController < ApplicationController
  
  
  def index
    @items = Item.all.order(created_at:"DESC")

  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :find_item, only: %i[show edit update destroy]
  before_action :not_collect_user, only: %i[edit update destroy]
  before_action :already_ordered, only: %i[edit update destroy]
  def index
    @items = Item.all.order(created_at: 'DESC')

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
  

  def show; end

  def edit; end


  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :item_text, :prefecture_id, :category_id, :status_id, :day_id, :shipping_id,
                                 :prefecture_id, :price).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def not_collect_user
    redirect_to root_path if @item.user != current_user
  end

  def already_ordered
    redirect_to root_path unless @item.order.nil?
  end
  
end
