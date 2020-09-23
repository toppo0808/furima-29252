class ItemsController < ApplicationController
 before_action :find_params, if: :devise_controller?

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
   find_params
  end

  def destroy
    find_params
    if @item.valid?
       @item.destroy
       return redirect_to root_path
    else
       render "show"
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:name,:explanation,:category_id,:status_id,:price,:area_id,:fee_id,:sending_date_id,:image).merge(user_id: current_user.id)
  end

    def find_params
      @item = Item.find(params[:id])
    end
end
