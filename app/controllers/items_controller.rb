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


   def show
    @item = Item.find(params[:id])
    @user = User.find(@item.id)
  end

   def edit
    @item = Item.find(params[:id])
  end
   def update
    @item = Item.find(params[:id])
    if @item.update
      redirect_to root_path
    else
      render :show
    end
  end
 def destroy
    item = Item.find(params[:id])
    if item.destroy
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
    params.require(:item).permit(:name,:category_id,:status_id,:price,:prefecture_id,:days_id,:shipping_id,:image,:text).merge(user_id:current_user.id)
  end
end
