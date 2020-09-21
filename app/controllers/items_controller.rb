class ItemsController < ApplicationController
 

  def index
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
    
   end

  def create
    @user = user.new(user_params)
    if @user.vilid?
      @user.save
      return redirect_to root_path
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:first_name,:lasa_name,:first_furigana,:last_furigana,:birthday)
  end

  # def item_params
  #   params.require(:item).permit(:name,:explanation,:category_id,:status_id,:price,:area_id,:sending_date_id,:image).marge(user_id: current_user.id)
  # end

end
