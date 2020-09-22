class ItemsController < ApplicationController
 

  def index
      @item = Item.all
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

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:category_id,:status_id,:price,:area_id,:fee_id,:sending_date_id,:image).merge(user_id: current_user.id)
  end

end
