class ItemsController < ApplicationController
 before_action :find_params, only: [:show,:destroy,:edit,:update]

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
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
  end

  def destroy
     if  @item.destroy
       return redirect_to root_path
    else
       render "show"
    end
  end

  def edit
  end

  def update
    if @item.user_id == current_user.id
      if @item.update(item_params)
         redirect_to item_path
      else
         render "edit"
      end
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
