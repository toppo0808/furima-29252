class ItemsController < ApplicationController
 

  def index
      @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    return redirect_to root_path
  end
  

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:category_id,:status_id,:price,:area_id,:fee_id,:sending_date_id,:image).merge(user_id: current_user.id)
  end

end
